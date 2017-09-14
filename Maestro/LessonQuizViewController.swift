//
//  LessonQuizViewController.swift
//  Maestro
//
//  Created by Paul Herz on 9/14/17.
//  Copyright © 2017 Maestro. All rights reserved.
//

import UIKit

class LessonQuizViewController: LessonCardViewController {
	
	var questions: [String] = ["Question 1", "Question 2", "Question 3"]

	var lessonQuizView: LessonQuizView {
		return view as! LessonQuizView
	}
	
	override func loadView() {
		view = LessonQuizView(frame: UIScreen.main.bounds)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		lessonQuizView.quizAnswers.delegate = self
		lessonQuizView.quizAnswers.dataSource = self
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

extension LessonQuizViewController: CheckboxListViewDelegate {
	func checkboxList(_ checkboxList: CheckboxListView, didChangeSelectionToIndex index: Int) {
		print("didChangeSelection to \"\(questions[index])\"")
	}
}

extension LessonQuizViewController: CheckboxListDataSource {
	func checkboxList(numberOfRowsInList checkboxList: CheckboxListView) -> Int {
		return questions.count
	}
	
	func checkboxList(_ checkboxList: CheckboxListView, titleForCheckboxAtRow row: Int) -> String {
		return questions[row]
	}
}
