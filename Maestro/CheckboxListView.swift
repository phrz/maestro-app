//
//  CheckboxListView.swift
//  Maestro
//
//  Created by Paul Herz on 9/14/17.
//  Copyright © 2017 Maestro. All rights reserved.
//

import UIKit

class CheckboxListView: UIView {

	var checkboxes: [CheckboxItemView]
	override var intrinsicContentSize: CGSize {
		get {
			var sum: CGFloat = 0.0
			checkboxes.forEach { c in
				sum += c.intrinsicContentSize.height
			}
			return CGSize(width: UIViewNoIntrinsicMetric, height: sum)
		}
	}
	
	override init(frame: CGRect) {
		checkboxes = ["A", "B", "C"].map { str -> CheckboxItemView in
			let c = CheckboxItemView(frame: .zero)
			c.titleLabel.text = str
			return c
		}
		super.init(frame: frame)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

}
