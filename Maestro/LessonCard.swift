//
//  LessonCard.swift
//  Maestro
//
//  Created by Paul Herz on 9/14/17.
//  Copyright © 2017 Maestro. All rights reserved.
//

import Foundation

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
}

struct LessonQuiz: LessonCard {
	let type: CardType = .quiz
	let questionText: String
	let imageURL: String?
	let answers: [QuizAnswer]
}

struct QuizAnswer {
	let answerText: String
	let isCorrect: Bool
}
