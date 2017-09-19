//
//  LessonRouter.swift
//  Maestro
//
//  Created by Paul Herz on 9/14/17.
//  Copyright © 2017 Maestro. All rights reserved.
//

import Foundation

class LessonRouter {
	static let shared = LessonRouter()
	
	var currentLesson: Lesson?
	
	func titleCard() -> LessonTitleViewController? {
		
		guard let currentLesson = currentLesson else {
			print("Router: warning, no current lesson.")
			return nil
		}
		
		let vc = LessonTitleViewController()
		vc.lessonTitle = currentLesson.title
		vc.lessonNumber = currentLesson.index
		
		return vc
	}
	
	func nextCard(after item: LessonLocationAware) -> LessonCardViewController? {
		
		var vc: LessonCardViewController?
		
		guard let currentLesson = currentLesson else {
			print("Router: warning, no current lesson.")
			return nil
		}
		
		guard let i = item.lessonCardIndex else {
			print("Router: warning, current card has no lesson index.")
			return nil
		}
		let next = i+1
		let lastIndex = currentLesson.cards.count - 1
		
		if next == lastIndex {
			return LessonCompletionViewController()
		} else if next > currentLesson.cards.count {
			return nil
		} else if let content = currentLesson.cards[next] as? LessonContent {
			vc = LessonContentViewController()
			vc!.lessonContent = content
		} else if let quiz = currentLesson.cards[next] as? LessonQuiz {
			vc = LessonQuizViewController()
			vc!.lessonContent = quiz
		}
		
		vc?.lessonCardIndex = next
		
		return vc
	}
	
	func pushNextCard(after item: LessonLocationAware, to nc: MaestroNavigationController) {
		guard let vc = nextCard(after: item) else {
			print("LessonRouter.pushNextCard(after:to:) did not receive a View Controller from nextCard(after:).")
			return
		}
		nc.pushViewController(vc, animated: true)
	}
}
