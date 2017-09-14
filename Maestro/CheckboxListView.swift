//
//  CheckboxListView.swift
//  Maestro
//
//  Created by Paul Herz on 9/14/17.
//  Copyright © 2017 Maestro. All rights reserved.
//

import UIKit

class CheckboxListView: UIView {
	
	var onSelectionChangeCallback: ((CheckboxListView,CheckboxItemView,UInt) -> Void)? = nil

	private var checkboxes: [CheckboxItemView]!
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
		super.init(frame: frame)
		checkboxes = ["A", "B", "C"].map { str -> CheckboxItemView in
			let c = CheckboxItemView(frame: .zero)
			c.titleLabel.text = str
			c.shouldUncheckOnSelection = false
			c.onTouchCallback = self.itemSelected(_:)
			addSubview(c)
			return c
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func itemSelected(_ item: CheckboxItemView) {
		guard let index = checkboxes.index(of: item) else {
			print("Warning: checkbox called itemSelected but was not a member of checklist")
			return
		}
		DispatchQueue.main.async {
			for (n,c) in self.checkboxes.enumerated() {
				if n == index { continue }
				c.changeState(checked: false, highlighted: nil)
			}
		}
		onSelectionChangeCallback?(self, checkboxes[index], UInt(index))
	}
	
	override func updateConstraints() {
		for (n,c) in checkboxes.enumerated() {
			c.snp.makeConstraints { make in
				if n == 0 {
					make.top.equalToSuperview()
				} else {
					make.top.equalTo(checkboxes[n-1].snp.bottom)
				}
				make.left.equalToSuperview()
				make.right.equalToSuperview()
			}
		}
		super.updateConstraints()
	}

}
