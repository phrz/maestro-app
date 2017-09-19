//
//  LessonQuizViewController.swift
//  Maestro
//
//  Created by Paul Herz on 9/14/17.
//  Copyright © 2017 Maestro. All rights reserved.
//

import UIKit

class LessonQuizViewController: LessonCardViewController {
	
	var answers: [QuizAnswer] = []
	var currentSelectedCheckbox: Int?
	
	// initially the next button says "Check" and checks the
	// answer. Once the answer is correctly provided, it will
	// actually go to the next slide.
	var nextButtonTriggersNext: Bool = false

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
		
		lessonQuizView.nextButton.setTitle("Check", for: .normal)
		lessonQuizView.nextButton.isEnabled = false
	}
	
	override func setLessonContent(_ lc: LessonCard) {
		guard let lq = lc as? LessonQuiz else {
			print("Bad cast")
			return
		}
		DispatchQueue.main.async {
			self.lessonQuizView.quizQuestion.text = lq.questionText
			self.answers = lq.answers
			self.lessonQuizView.quizAnswers.reloadData()
		}
		super.setLessonContent(lc)
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	override func didTouchNextButton(sender: UIButton) {
		
		guard !nextButtonTriggersNext else {
			LessonRouter.shared.pushNextCard(after: self, to: self.navigationController as! MaestroNavigationController)
			return
		}
		
		sender.isEnabled = false
		self.lessonQuizView.quizAnswers.isUserInteractionEnabled = false
		
		guard let selected = currentSelectedCheckbox else {
			print("Could not retrieve answer corresponding to checkbox: currentSelectedCheckbox was nil")
			return
		}
		
		let isCorrect = answers[selected].isCorrect
		
		// Highlight the answer, either red or green
		let selectedBox = lessonQuizView.quizAnswers.checkboxes[selected]
		if isCorrect {
			// Mark selected (correct) answer in green and unfreeze Next
			// button to proceed. Do not unfreeze checkboxes.
			selectedBox.tintColor = UIColor(colorLiteralRed: 0.296, green: 0.8476, blue: 0.39, alpha: 1)
			sender.setTitle("Next", for: .normal)
			nextButtonTriggersNext = true
			sender.isEnabled = true
		} else {
			// Mark selected (wrong) answer in red and unfreeze checkboxes
			// to allow user to select another answer. Do not unfreeze Check
			// button until answer is changed.
			selectedBox.tintColor = .red
			self.lessonQuizView.quizAnswers.isUserInteractionEnabled = true
		}
	}
}

extension LessonQuizViewController: CheckboxListViewDelegate {
	func checkboxList(_ checkboxList: CheckboxListView, didChangeSelectionToIndex index: Int) {
//		print("didChangeSelection to \"\(answers[index].answerText)\"")
		lessonQuizView.nextButton.isEnabled = true
		currentSelectedCheckbox = index
	}
}

extension LessonQuizViewController: CheckboxListDataSource {
	func checkboxList(numberOfRowsInList checkboxList: CheckboxListView) -> Int {
		return answers.count
	}
	
	func checkboxList(_ checkboxList: CheckboxListView, titleForCheckboxAtRow row: Int) -> String {
		return answers[row].answerText
	}
}
