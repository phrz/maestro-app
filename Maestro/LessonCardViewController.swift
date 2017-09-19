//
//  LessonCardViewController.swift
//  Maestro
//
//  Created by Paul Herz on 9/13/17.
//  Copyright © 2017 Maestro. All rights reserved.
//

import UIKit

class LessonCardViewController: UIViewController, LessonLocationAware {
	
	var lessonCardIndex: Int?
	var lessonContent: LessonCard? {
		didSet {
			guard lessonContent != nil else { return }
			setLessonContent(lessonContent!)
		}
	}
	
	var lessonCardView: LessonCardView {
		return view as! LessonCardView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		lessonCardView.nextButton.addTarget(
			self,
			action: #selector(didTouchNextButton(sender:)),
			for: .touchUpInside
		)
	}
	
	func setLessonContent(_ lc: LessonCard) {
		if let urlString = lessonContent?.imageURL, let url = URL(string: urlString) {
			loadImage(withURL: url)
		}
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func didTouchNextButton(sender: UIButton) {
		print("Warning: unhandled didTouchNextButton")
	}
	
	override func willMove(toParentViewController parent: UIViewController?) {
		self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
		super.willMove(toParentViewController: parent)
	}
	
	func loadImage(withURL url: URL) {
		API.shared.loadImage(withURL: url).then(on: .main) { image -> Void in
//			self.lessonCardView.lessonImage.image = image
			
			// fade in image view
			UIView.transition(
				with: self.lessonCardView.lessonImage,
				duration:0.5,
				options: .transitionCrossDissolve,
				animations: { self.lessonCardView.lessonImage.image = image },
				completion: nil
			)
			
		}.catch { error in
			print("LessonCardViewController.loadImage: failed to load URL \(url) with error \(error)")
		}
	}
	
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
