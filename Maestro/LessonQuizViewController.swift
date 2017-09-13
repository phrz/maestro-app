
//
//  QuizContentViewController.swift
//  Maestro
//
//  Created by Kena Du on 9/7/17.
//  Copyright © 2017 Maestro. All rights reserved.
//

import UIKit

class LessonQuizViewController: UIViewController {
	
	var lessonQuizView: LessonQuizView {
		return view as! LessonQuizView
	}
	
	override func loadView() {
		view = LessonQuizView(frame: UIScreen.main.bounds)
		self.title = "QUIZ"
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		//  for choice in quizContentView.choiceArray{
		
		
		for (index, _) in lessonQuizView.choiceArray.enumerated() {
			if(index == 2) {
				lessonQuizView.choiceArray[index].addTarget(
					self,
					action: #selector(showRightAlert(sender:)),
					for: .touchUpInside
				)
			} else {
				lessonQuizView.choiceArray[index].addTarget(
					self,
					action: #selector(showWrongAlert(sender:)),
					for: .touchUpInside
				)
			}
		}
		
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	func showRightAlert(sender: UIButton!)
	{
		let alert = UIAlertController(title: "Right Answer", message: "Good Job", preferredStyle: UIAlertControllerStyle.alert)
		alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
		
		self.present(alert, animated: true, completion: nil)
	}
	
	func showWrongAlert(sender: UIButton!)
	{
		let alert = UIAlertController(title: "Wrong Answer!", message: "Choose Again", preferredStyle: UIAlertControllerStyle.alert)
		alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
		
		self.present(alert, animated: true, completion: nil)
	}
	
	/*
	// Only override draw() if you perform custom drawing.
	// An empty implementation adversely affects performance during animation.
	override func draw(_ rect: CGRect) {
	// Drawing code
	}
	*/
	
}
