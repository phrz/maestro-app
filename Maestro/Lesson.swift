//
//  Lesson.swift
//  Maestro
//
//  Created by Paul Herz on 9/14/17.
//  Copyright © 2017 Maestro. All rights reserved.
//

import Foundation
import Parse

struct Lesson {
	let title: String
	let index: Int
	let cards: [LessonCard]
	
	init?(fromPFObject obj: [String: Any]){
		guard
			let title = obj["title"] as? String,
			let index = obj["index"] as? Int,
			let _cards = obj["cards"] as? [PFObject]
		else {
			return nil
		}
		
		var cards = [LessonCard]()
		for object in _cards {
			//get type
			//initialize card/quiz object
			//add object to cards array
		}
		
		self.title = title
		self.index = index
		self.cards = cards
	
		
	}
	
	
	init(title: String, index: Int, cards: [LessonCard]) {
		self.title = title
		self.index = index
		self.cards = cards
	}

	
	
	
}
