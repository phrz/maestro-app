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
	
	init() {}
}
