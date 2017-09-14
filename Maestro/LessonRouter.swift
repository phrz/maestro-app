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
	
	func nextCard(after item: LessonLocationAware) -> LessonCardViewController {
		print("LessonRouter.nextCard stub")
		let vc = LessonContentViewController()
		
		if let i = item.lessonCardIndex {
			vc.lessonCardIndex = i+1
		} else {
			print("Warning: nextCard found nil index in stub")
		}
		
		return vc
	}
}
