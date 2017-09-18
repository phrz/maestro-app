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
	
	init?(fromJSON json: [String: Any])
}

struct LessonContent: LessonCard {
	let type: CardType = .content
	let text: String
	let imageURL: String?
	
	init?(fromJSON json: [String: Any]) {
		guard
			let text = json["text"] as? String
		else {
			print("LessonContent.init?(fromJSON:) could not cast text and image keys from content JSON.")
			return nil
		}
		
		self.text = text
		
		// Optional properties
		if let imageURL = json["image"] as? String {
			self.imageURL = imageURL
		} else {
			self.imageURL = nil
		}
	}
}

//need something that checks type property

struct LessonQuiz: LessonCard {
	let type: CardType = .quiz
	let questionText: String
	let imageURL: String?
	let answers: [QuizAnswer]
	
	init?(fromJSON json: [String: Any]) {
		guard
			let questionText = json["question"] as? String,
			let _answers = json["answers"] as? Array<[String: Any]>
		else {
			print("LessonQuiz.init?(fromJSON:) could not cast text and image keys from content JSON.")
			return nil
		}
		
		self.questionText = questionText
		
		var answers = [QuizAnswer]()
		for _answer in _answers {
			guard let answer = QuizAnswer(fromJSON: _answer) else { return nil }
			answers.append(answer)
		}
		self.answers = answers
		
		// Optional properties
		if let imageURL = json["image"] as? String {
			self.imageURL = imageURL
		} else {
			self.imageURL = nil
		}
	}
}

struct QuizAnswer {
	let answerText: String
	let isCorrect: Bool
	
	init?(fromJSON json: [String: Any]) {
		guard
			let answerText = json["answer"] as? String,
			let isCorrect = json["correct"] as? Bool
		else {
			print("QuizAnswer.init?(fromJSON:) could not cast answer and correct keys from JSON.")
			return nil
		}
		self.answerText = answerText
		self.isCorrect = isCorrect
	}
}
