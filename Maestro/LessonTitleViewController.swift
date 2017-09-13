//
//  LessonTitleViewController.swift
//  Maestro
//
//  Created by Paul Herz on 8/31/17.
//  Copyright © 2017 Maestro. All rights reserved.
//

import UIKit

class LessonTitleViewController: UIViewController {
	
	var lessonTitleView: LessonTitleView {
		return view as! LessonTitleView
	}
	
	override func loadView() {
		view = LessonTitleView(frame: UIScreen.main.bounds)
		self.title = "LESSON"
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		lessonTitleView.startButton.addTarget(
			self,
			action: #selector(didTouchStartButton(sender:)),
			for: .touchUpInside
		)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	func didTouchStartButton(sender: UIButton) {
		let vc = LessonContentViewController()
		self.navigationController?.pushViewController(vc, animated: true)
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
