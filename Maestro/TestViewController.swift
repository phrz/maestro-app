//
//  TestViewController.swift
//  Maestro
//
//  Created by Paul Herz on 8/26/17.
//  Copyright © 2017 Maestro. All rights reserved.
//

import UIKit
import SnapKit

class TestViewController: UIViewController {
	
	var testView: TestView {
		return view as! TestView
	}
	
	override func loadView() {
		view = TestView(frame: UIScreen.main.bounds)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
}

