//
//  LessonCompletionViewController.swift
//  Maestro
//
//  Created by Paul Herz on 9/18/17.
//  Copyright © 2017 Maestro. All rights reserved.
//

import UIKit

class LessonCompletionViewController: LessonCardViewController {

	var lessonCompletionView: LessonCompletionView {
		return view as! LessonCompletionView
	}
	
	override func loadView() {
		view = LessonCompletionView(frame: UIScreen.main.bounds)
	}
	
	override func setLessonContent(_ lc: LessonCard) { /* stub */ }
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
