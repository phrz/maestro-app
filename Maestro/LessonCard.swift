//
//  LessonCard.swift
//  Maestro
//
//  Created by Paul Herz on 9/14/17.
//  Copyright © 2017 Maestro. All rights reserved.
//

import Foundation
import Parse

enum CardType {
	case content, quiz
}

protocol LessonCard {
	var type: CardType { get }
	var imageURL: String? { get }
}

struct LessonContent: LessonCard {
	let type: CardType = .content
	let text: String
	let imageURL: String?
	
	init?(fromPFObject obj: [String: Any]){
		guard
			let type = obj["type"] as? CardType,
			let text = obj["text"] as? String,
			let imageURL = obj["imageURL"] as? String
		else{
			return nil
		}
		
		self.type = type
		self.text = text
		self.imageURL = imageURL
	}
}

//need something that checks type property

struct LessonQuiz: LessonCard {
	let type: CardType = .quiz
	let questionText: String
	let imageURL: String?
	let answers: [QuizAnswer]
	
	/*init?(fromPFObject obj: [String: Any]){
		guard
			let type = obj["type"] as? CardType,
			let questionText = obj["questionText"] as? String,
			let imageURL = obj["imageURL"] as? String,
			let _answers = obj["answers"] as? [PFObject]
		else{
				return nil
		}
		
		self.type = type
		self.questionText = text
		self.imageURL = imageURL
		self.answers = 
	}*/

}

struct QuizAnswer {
	let answerText: String
	let isCorrect: Bool
}
