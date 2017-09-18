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
		guard next < currentLesson.cards.count else { return nil }
//		print("i: \(i), next: \(next)")
		
		if let content = currentLesson.cards[next] as? LessonContent {
			vc = LessonContentViewController()
			vc!.lessonContent = content
		} else if let quiz = currentLesson.cards[next] as? LessonQuiz {
			vc = LessonQuizViewController()
			vc!.lessonContent = quiz
		}
		vc?.lessonCardIndex = next
//		print("Getting card #\(i+1) from lesson \(currentLesson?.index ?? -99)")
		
		return vc
	}
}
