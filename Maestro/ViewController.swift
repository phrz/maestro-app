//
//  ViewController.swift
//  Maestro
//
//  Created by Paul Herz on 8/26/17.
//  Copyright © 2017 Maestro. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
	
	var testLabel: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		testLabel = {
			let t = UILabel()
			t.backgroundColor = .lightGray
			t.text = "🖐🌎"
			t.textAlignment = .center
			return t
		}()
		
		view.addSubview(testLabel)
		updateViewConstraints()
	}
	
	override func updateViewConstraints() {
		testLabel.snp.makeConstraints { (make) in
			make.width.equalTo(200)
			make.height.equalTo(60)
			make.center.equalTo(view)
		}
		super.updateViewConstraints()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
}

