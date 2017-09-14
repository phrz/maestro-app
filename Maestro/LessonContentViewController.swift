//
//  LessonContentViewController.swift
//  Maestro
//
//  Created by Kena Du on 9/3/17.
//  Copyright © 2017 Maestro. All rights reserved.
//

import UIKit

class LessonContentViewController: LessonCardViewController {
	
	var lessonContent: LessonContent? {
		didSet {
			guard let lc = lessonContent else { return }
			setLessonContent(lc)
		}
	}
	
    var lessonContentView: LessonContentView {
        return view as! LessonContentView
    }
    
    override func loadView() {
        view = LessonContentView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
	
	func setLessonContent(_ lc: LessonContent) {
		DispatchQueue.main.async {
			self.lessonContentView.lessonDetail.text = lc.text
			if let img = lc.imageURL {
				self.lessonContentView.lessonImage.image = UIImage(named: img)
			} else {
				print("NO IMG")
			}
		}
	}
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	override func didTouchNextButton(sender: UIButton) {
		guard let vc = LessonRouter.shared.nextCard(after: self) else { return }
		self.navigationController?.pushViewController(vc, animated: true)
	}

}
