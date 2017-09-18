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
	
	init?(fromPFObject o: PFObject){
		guard
			let title = o["title"] as? String,
			let _index = o["number"] as? String,
			let index = Int(_index),
			let _cards = o["content"] as? [Any]
		else {
			print("Lesson.init?(fromPFObject:) failed when casting keys title, index, and cards from PFObject.")
			return nil
		}
		
		var cards: [LessonCard] = []
		for any in _cards {
			guard
				let cardObject = any as? [String: Any],
				let rawType = cardObject["type"] as? String,
				let type = CardType(rawValue: rawType)
			else {
				print("Lesson.init?(fromPFObject:) could not cast Any to [String: Any] for individual lesson card.")
				return nil
			}
			
			var card: LessonCard?
			switch type {
			case .content:
				card = LessonContent(fromJSON: cardObject)
			case .quiz:
				card = LessonQuiz(fromJSON: cardObject)
			}
			guard card != nil else {
				print("Lesson.init?(fromPFObject:) failed when calling LessonContent or LessonQuiz failable initializer.")
				return nil
			}
			cards.append(card!)
			
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
