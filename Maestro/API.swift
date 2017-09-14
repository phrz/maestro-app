//
//  API.swift
//  Maestro
//
//  Created by Paul Herz on 9/14/17.
//  Copyright © 2017 Maestro. All rights reserved.
//

import Foundation
import Parse
//import PromiseKit

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
	
	func getAllLessons() {
		let query = PFQuery(className: "lesson")
		query.findObjectsInBackground { object, error in
			if let error = error {
				print("ERROR!!! \(error)")
			} else if let object = object {
				print("OBJECT \(object)")
			} else {
				print("success, but empty object.")
			}
		}
	}
}
