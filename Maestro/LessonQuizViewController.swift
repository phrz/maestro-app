//
//  LessonQuizViewController.swift
//  Maestro
//
//  Created by Paul Herz on 9/14/17.
//  Copyright © 2017 Maestro. All rights reserved.
//

import UIKit

class LessonQuizViewController: LessonCardViewController {

	var lessonQuizView: LessonQuizView {
		return view as! LessonQuizView
	}
	
	override func loadView() {
		view = LessonQuizView(frame: UIScreen.main.bounds)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	override func didTouchNextButton(sender: UIButton) {
		//let vc = LessonCardViewController()
		//self.navigationController?.pushViewController(vc, animated: true)
	}

}
