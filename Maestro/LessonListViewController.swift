//
//  LessonListViewController.swift
//  Maestro
//
//  Created by Paul Herz on 9/19/17.
//  Copyright © 2017 Maestro. All rights reserved.
//

import UIKit

class LessonListViewController: UITableViewController {

	let items = ["A","B","C"]
	
    override func viewDidLoad() {
        super.viewDidLoad()
		tableView.register(LessonCell.self, forCellReuseIdentifier: "lessonCell")
		tableView.dataSource = self
		tableView.delegate = self
		tableView.separatorColor = .clear
		tableView.backgroundColor = .darkGray
		tableView.rowHeight = UITableViewAutomaticDimension
		tableView.estimatedRowHeight = 50
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }
	
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lessonCell", for: indexPath) as! LessonCell
		cell.cellCardPrimaryLabel.text = items[indexPath.row]
        return cell
    }

}
