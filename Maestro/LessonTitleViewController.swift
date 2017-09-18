//
//  LessonTitleViewController.swift
//  Maestro
//
//  Created by Paul Herz on 8/31/17.
//  Copyright © 2017 Maestro. All rights reserved.
//

import UIKit

class LessonTitleViewController: UIViewController, LessonLocationAware {
	
	var lessonCardIndex: Int? = -1
	
	var lessonTitleView: LessonTitleView {
		return view as! LessonTitleView
	}
	
	var lessonTitle: String? {
		didSet {
			DispatchQueue.main.async {
				self.lessonTitleView.lessonTitle.text = self.lessonTitle
			}
		}
	}
	
	var lessonNumber: Int? {
		didSet {
			DispatchQueue.main.async {
				self.lessonTitleView.lessonDetail.text = "LESSON \(self.lessonNumber!)"
			}
		}
	}
	
	override func loadView() {
		view = LessonTitleView(frame: UIScreen.main.bounds)
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		lessonTitleView.startButton.addTarget(
			self,
			action: #selector(didTouchStartButton(sender:)),
			for: .touchUpInside
		)
		
		//navigationItem.titleView = UIImageView(image: UIImage(named: "maestro-m"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	func didTouchStartButton(sender: UIButton) {		
		let vc = LessonRouter.shared.nextCard(after: self)
		self.navigationController?.pushViewController(vc!, animated: true)
	}
	
	override func willMove(toParentViewController parent: UIViewController?) {
		self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
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
