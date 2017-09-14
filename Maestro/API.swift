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

class API {
	static let shared = API()
	
	init() {
		/*let configuration = ParseClientConfiguration { c -> Void in
			c.server = "http://maestro.gdn/parse"
			c.applicationId = "maestro"
			c.clientKey = "orange"
		}
		Parse.initialize(with: configuration)*/
	}
	
	/*public func getAllLessons() -> Promise<[Any]> {
		return parseGetAllLessons().then { objects -> [Any] in
			for object in objects {
				print("\n\n\n\(type(of: object))")
			}
			return []
		}.catch { error in
			print("Caught error in getAllLessons")
		}
	}
	
	public func getLesson(numbered lessonNumber: Int) -> Promise<Any> {
		return parseGetLesson(numbered: lessonNumber).then { (data: [PFObject]) -> Any in
			return data
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
	
	private func parseGetLesson(numbered lessonNumber: Int) -> Promise<[PFObject]> {
		return Promise<[PFObject]> { fulfill, reject in
			let query = PFQuery(className: "lesson")
			query.whereKey("number", equalTo: [lessonNumber])
			query.findObjectsInBackground { object, error in
				if let error = error {
					reject(error)
				} else if let object = object {
					fulfill(object)
				} else {
					fulfill([])
				}
			}
		}
	}*/
	
	public func getLesson(numbered lessonNumber: Int) -> Promise<Lesson> {
		print("Warning: API.getLesson(numbered:) stub")
		let title = "The Staff"
		let index = 1
		let cards = [
			LessonContent(text: "The staff is a tool to graphically represent music. It consists of 5 lines and 4 spaces on which to plot notes. Each line or space represents a letter in the musical alphabet.", imageURL: "card_1"),
			LessonContent(text: "There are 7 letters that make up the musical alphabet: A, B, C, D, E, F, G. Progressing through all 7 notes in order makes a scale. The letters restart after G, so the note after G is always A. The simplest scale is the C Major Scale: C, D, E, F, G, A, B, C", imageURL: "card_2"),
			LessonContent(text: "The clefs determine where the notes go on the staff. The treble clef (or “G” clef) looks like a cursive G, and denotes a G on the second line from the bottom: the “curl” of the G curls around the second line. The bass clef (or “F” clef) looks like a stylized F, with the two dots, or “lines”, of the F hugging the second line from the top of the staff", imageURL: "card_3"),
			LessonContent(text: "If you need more lines on the staff than the allotted 5 lines and 4 spaces, one creates ledger lines as seen below. These continue at the same steps as the notes on the staff, for readability.", imageURL: "card_4")
			
		]
		let lesson = Lesson(title: title, index: index, cards: cards)
		return Promise<Lesson>(value: lesson)
	}
	
}
