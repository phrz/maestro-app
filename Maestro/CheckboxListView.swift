//
//  CheckboxListView.swift
//  Maestro
//
//  Created by Paul Herz on 9/14/17.
//  Copyright © 2017 Maestro. All rights reserved.
//

import UIKit

protocol CheckboxListViewDelegate: class {
	func checkboxList(_ checkboxList: CheckboxListView, didChangeSelectionToIndex index: Int)
}

protocol CheckboxListDataSource: class {
	func checkboxList(numberOfRowsInList checkboxList: CheckboxListView) -> Int
	func checkboxList(_ checkboxList: CheckboxListView, titleForCheckboxAtRow row: Int) -> String
}

class CheckboxListView: UIView {
	
	weak var delegate: CheckboxListViewDelegate?
	weak var dataSource: CheckboxListDataSource? {
		didSet {
			reloadData()
		}
	}
	var count: Int = 0

	private var checkboxes: [CheckboxItemView]! = []
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
		translatesAutoresizingMaskIntoConstraints = false
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func reloadData() {
		guard let dataSource = dataSource else {
			print("Warning: CheckboxListView has no dataSource")
			return
		}
		for i in 0..<count {
			if let v = viewWithTag(i) {
				v.removeFromSuperview()
			}
		}
		checkboxes = []
		
		count = dataSource.checkboxList(numberOfRowsInList: self)
		print("dataSource said count was \(count)")
		for i in 0..<count {
			let title = dataSource.checkboxList(self, titleForCheckboxAtRow: i)
			let c = CheckboxItemView(frame: .zero)
			c.tag = i
			c.titleLabel.text = title
			c.shouldUncheckOnSelection = false
			c.onTouchCallback = self.itemSelected(_:)
			addSubview(c)
			checkboxes.append(c)
		}
		
		setNeedsUpdateConstraints()
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
		delegate?.checkboxList(self, didChangeSelectionToIndex: index)
	}
	
	override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
		snp.makeConstraints { make in
			make.height.equalTo(intrinsicContentSize.height)
		}
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
		if let last = checkboxes.last {
//			snp.makeConstraints { make in
//				make.bottom.equalTo(last)
//			}
			last.snp.makeConstraints { make in
				make.bottom.equalToSuperview()
			}
		}
		super.updateConstraints()
	}

}
