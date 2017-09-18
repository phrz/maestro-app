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
		lessonQuizView.nextButton.titleLabel?.text = "Check"
	}
	
	override func setLessonContent(_ lc: LessonCard) {
		guard let lq = lc as? LessonQuiz else {
			print("Bad cast")
			return
		}
		DispatchQueue.main.async {
			self.lessonQuizView.quizQuestion.text = lq.questionText
			if let img = lq.imageURL {
				self.lessonQuizView.lessonImage.image = UIImage(named: img)
			} else {
				print("NO IMG")
			}
			self.answers = lq.answers
			self.lessonQuizView.quizAnswers.reloadData()
		}
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	override func didTouchNextButton(sender: UIButton) {
		guard let vc = LessonRouter.shared.nextCard(after: self) else {
			return
		}
		self.navigationController?.pushViewController(vc, animated: true)
	}
}

extension LessonQuizViewController: CheckboxListViewDelegate {
	func checkboxList(_ checkboxList: CheckboxListView, didChangeSelectionToIndex index: Int) {
		print("didChangeSelection to \"\(answers[index].answerText)\"")
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
