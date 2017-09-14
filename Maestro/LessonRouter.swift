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
		print("LessonRouter.nextCard stub")
		
		var vc: LessonCardViewController?
		
		guard let i = item.lessonCardIndex else { return nil }
		let next = i+1
		guard next < (currentLesson?.cards.count)! else { return nil }
		
		let cvc = LessonContentViewController()
		cvc.lessonCardIndex = i+1
		cvc.lessonContent = currentLesson!.cards[i+1] as? LessonContent
		vc = cvc
		print("Getting card #\(i+1) from lesson \(currentLesson?.index ?? -99)")
		
		return vc!
	}
}
