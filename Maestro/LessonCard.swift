//
//  LessonCard.swift
//  Maestro
//
//  Created by Paul Herz on 9/14/17.
//  Copyright © 2017 Maestro. All rights reserved.
//

import Foundation
import Parse

enum CardType: String {
	case content = "content", quiz = "quiz"
}

protocol LessonCard {
	var type: CardType { get }
	var imageURL: String? { get }
	
	init?(fromPFObject o: PFObject)
}

struct LessonContent: LessonCard {
	let type: CardType = .content
	let text: String
	let imageURL: String?
	
	init?(fromPFObject o: PFObject) {
//		guard
//			let type = obj["type"] as? CardType,
//			let text = obj["text"] as? String,
//			let imageURL = obj["imageURL"] as? String
//		else{
//			return nil
//		}
//		
//		self.type = type
//		self.text = text
//		self.imageURL = imageURL
		print("LessonContent.init?(fromPFObject:) stub (always fails).")
		return nil
	}
}

//need something that checks type property

struct LessonQuiz: LessonCard {
	let type: CardType = .quiz
	let questionText: String
	let imageURL: String?
	let answers: [QuizAnswer]
	
	init?(fromPFObject o: PFObject) {
		print("LessonQuiz.init?(fromPFObject:) stub (always fails).")
		return nil
	}
}

struct QuizAnswer {
	let answerText: String
	let isCorrect: Bool
}
