//
//  LessonLocationAware.swift
//  Maestro
//
//  Created by Paul Herz on 9/14/17.
//  Copyright © 2017 Maestro. All rights reserved.
//

import Foundation

protocol LessonLocationAware: class {
	var lessonCardIndex: Int? { get }
}
