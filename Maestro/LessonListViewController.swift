//
//  LessonListViewController.swift
//  Maestro
//
//  Created by Paul Herz on 9/19/17.
//  Copyright © 2017 Maestro. All rights reserved.
//

import UIKit

class LessonListViewController: UITableViewController {

	var stubs: [LessonStub] = []
	
    override func viewDidLoad() {
        super.viewDidLoad()
		tableView.register(LessonCell.self, forCellReuseIdentifier: "lessonCell")
		tableView.dataSource = self
		tableView.delegate = self
		tableView.separatorColor = .clear
		tableView.backgroundColor = UIColor(white: 0.5, alpha: 1)
		tableView.rowHeight = UITableViewAutomaticDimension
		tableView.estimatedRowHeight = 50
		loadLessons()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	func loadLessons() {
		API.shared.getLessonStubs().then(on: .main) { stubs -> Void in
			self.stubs = stubs
			self.tableView.reloadData()
		}.catch { error in
			print("loadLessons(): caught error from API.getLessonStubs()")
		}
	}

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return stubs.count
    }
	
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lessonCell", for: indexPath) as! LessonCell
		let stub = stubs[indexPath.row]
		cell.cellCardPrimaryLabel.text = stub.title
		cell.cellCardSecondaryLabel.text = "LESSON \(stub.index)"
        return cell
    }
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let stub = stubs[indexPath.row]
		API.shared.getLesson(numbered: stub.index).then { lesson -> Void in
			LessonRouter.shared.currentLesson = lesson
			LessonRouter.shared.pushTitleCard(to: self.navigationController as! MaestroNavigationController)
		}.catch { error in
			print("LessonListViewController - error in tableView(_:didSelectRowAt:) \(error)")
		}
	}

}
