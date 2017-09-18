//
//  API.swift
//  Maestro
//
//  Created by Paul Herz on 9/14/17.
//  Copyright © 2017 Maestro. All rights reserved.
//

import Foundation
import Parse
import PromiseKit

enum APIError: Error {
	case couldNotInterpretLessonData, objectNotFound
}

class API {
	static let shared = API()
	
	init() {
		let configuration = ParseClientConfiguration { c -> Void in
			c.server = "http://maestro.gdn/parse"
			c.applicationId = "maestro"
			c.clientKey = "orange"
		}
		Parse.initialize(with: configuration)
	}
	
	/*
	public func getAllLessons() -> Promise<[Lesson]> {
		return parseGetAllLessons().then { objects -> [Lesson] in
			for object in objects {
				print("\n\n\n\(type(of: object))")
				getAllLessonCards()
			}
			return []
		}.catch { error in
			print("Caught error in getAllLessons")
		}
	}
	
	private func parseGetAllLessons() -> Promise<[PFObject]> {
		return Promise<[PFObject]> { fulfill, reject in
			let query = PFQuery(className: "lesson")
			query.findObjectsInBackground { object, error in
				if let error = error {
					reject(error)
				} else if let object = object {
					fulfill(object)
				} else {
					fulfill([])
				}
			} // end query
		} // end promise
	}
	*/
	
	public func getLesson(numbered lessonNumber: Int) -> Promise<Lesson> {
		return parseGetLesson(numbered: lessonNumber).then { data -> Lesson in
			guard let lesson = Lesson(fromPFObject: data) else {
				throw APIError.couldNotInterpretLessonData
			}
			return lesson
		}.catch { error in
			print("API.getLesson(numbered:) error: \(error)")
		}
	}
	
	private func parseGetLesson(numbered lessonNumber: Int) -> Promise<PFObject> {
		return Promise<PFObject> { fulfill, reject in
			let query = PFQuery(className: "lesson")
			query.whereKey("number", equalTo: String(lessonNumber))
			query.findObjectsInBackground { objects, error in
				if let error = error {
					reject(error)
				} else if let objects = objects, objects.count > 0 {
					fulfill(objects[0])
				} else {
					print("API.parseGetLesson(numbered:) failed to retrieve lesson #\(lessonNumber): objects = \(objects?.debugDescription ?? "nil")")
					reject(APIError.objectNotFound)
				}
			}
		}
	}
	
	/*
	// backup mock implementation
	public func getLesson(numbered lessonNumber: Int) -> Promise<Lesson> {
		print("Warning: API.getLesson(numbered:) stub")
		let title = "The Staff"
		let index = 1
		let cards: [LessonCard] = [
			LessonContent(text: "The staff is a tool to graphically represent music. It consists of 5 lines and 4 spaces on which to plot notes. Each line or space represents a letter in the musical alphabet.", imageURL: "card_1"),
			LessonContent(text: "There are 7 letters that make up the musical alphabet: A, B, C, D, E, F, G. Progressing through all 7 notes in order makes a scale. The letters restart after G, so the note after G is always A. The simplest scale is the C Major Scale: C, D, E, F, G, A, B, C", imageURL: "card_2"),
			LessonContent(text: "The clefs determine where the notes go on the staff. The treble clef (or “G” clef) looks like a cursive G, and denotes a G on the second line from the bottom: the “curl” of the G curls around the second line. The bass clef (or “F” clef) looks like a stylized F, with the two dots, or “lines”, of the F hugging the second line from the top of the staff", imageURL: "card_3"),
			LessonContent(text: "If you need more lines on the staff than the allotted 5 lines and 4 spaces, one creates ledger lines as seen below. These continue at the same steps as the notes on the staff, for readability.", imageURL: "card_4"),
			LessonContent(text: "Sharps and flats are notations in music that modify the note’s pitch by a half-step. Sharp means a half-step higher and flat means a half-step lower. Accidentals are the small symbols that appear before note-heads in the piece. Sharps and flats also appear in the key signature at the beginning of a piece.", imageURL: "card_5"),
			LessonContent(text: "A key signature at the beginning of a piece or line of music tells you which notes are sharp and flat for consequent measures. For example, the key signature below (would be above) says that all G’s, C’s, and F’s are sharp. Accidentals are written before the note-head and change the pitch regardless of the key signature: e.g. a C sharp in the key signature denoted by an accidental as C flat is played as C flat", imageURL: "card_6"),
			LessonQuiz(questionText: "What note is this?", imageURL: "quiz_card", answers: [
				QuizAnswer(answerText: "B-flat", isCorrect: false),
				QuizAnswer(answerText: "C-flat", isCorrect: true),
				QuizAnswer(answerText: "C-natural", isCorrect: false),
				QuizAnswer(answerText: "C-sharp", isCorrect: false)
			])
		]
		let lesson = Lesson(title: title, index: index, cards: cards)
		return Promise<Lesson>(value: lesson)
	}
	*/
	
}
