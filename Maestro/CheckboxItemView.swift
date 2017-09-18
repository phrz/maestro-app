//
//  CheckboxItemView.swift
//  Maestro
//
//  Created by Paul Herz on 9/14/17.
//  Copyright © 2017 Maestro. All rights reserved.
//

import UIKit

class CheckboxItemView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
	
	let titleLabel: UILabel
	let box: UIView
	let boxLayer: CAShapeLayer
	var checkLayer: CAShapeLayer
	
	private(set) var isChecked: Bool = false
	private(set) var isHighlighted: Bool = false
	var shouldUncheckOnSelection: Bool = true
	
	var onTouchCallback: ((CheckboxItemView) -> Void)? = nil
	
	override var intrinsicContentSize: CGSize {
		return CGSize(width: UIViewNoIntrinsicMetric, height: intrinsicHeight)
	}
	
	private var intrinsicHeight: CGFloat {
		switch traitCollection.verticalSizeClass {
		case .regular:
			return 50
		case .compact:
			return 40
		default:
			print("Warning: unknown size class in CheckboxItemView")
			return UIViewNoIntrinsicMetric
		}
	}
	
	override func contentHuggingPriority(for axis: UILayoutConstraintAxis) -> UILayoutPriority {
		switch axis {
		case .horizontal:
			return UILayoutPriorityFittingSizeLevel
		case .vertical:
			return UILayoutPriorityRequired
		}
	}
	
	override init(frame: CGRect) {
		titleLabel = {
			let t = UILabel()
			t.lineBreakMode = .byWordWrapping
			t.numberOfLines = 0
			t.textColor = .black
			t.text = "Label"
			return t
		}()
		
		box = UIView()
		boxLayer = CAShapeLayer()
		checkLayer = CAShapeLayer()
		
		super.init(frame: frame)
		titleLabel.textColor = tintColor
		
		translatesAutoresizingMaskIntoConstraints = false
		
		redrawCheckboxForCurrentState()
		isUserInteractionEnabled = true
		
		box.layer.addSublayer(boxLayer)
		box.layer.addSublayer(checkLayer)
		addSubview(titleLabel)
		addSubview(box)
		
		setNeedsUpdateConstraints()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func redrawCheckboxForCurrentState() {
		DispatchQueue.main.async {
			let l = self.boxLayer
			let c = self.checkLayer
			let t = self.titleLabel
			let h = self.intrinsicHeight
			
			c.strokeColor = UIColor.clear.cgColor
			l.strokeColor = UIColor.clear.cgColor
			
			c.path = UIBezierPath(ovalIn: CGRect(x: 0.4*h, y: 0.4*h, width: 0.2*h, height: 0.2*h)).cgPath
			
			if self.isChecked {
				// check
				c.fillColor = UIColor.white.cgColor
				// box
				let path = UIBezierPath(ovalIn: CGRect(x: 0.14*h, y: 0.14*h, width: 0.72*h, height: 0.72*h))
				l.path = path.cgPath
				let alpha = self.isHighlighted ? 0.6 : 1
				l.fillColor = self.tintColor.withAlphaComponent(CGFloat(alpha)).cgColor
				// label
				t.alpha = 1
			} else {
				// check
				c.fillColor = UIColor.clear.cgColor
				// box
				let path = UIBezierPath(ovalIn: CGRect(x: 0.2*h, y: 0.2*h, width: 0.6*h, height: 0.6*h))
				l.path = path.cgPath.copy(strokingWithWidth: 3, lineCap: .butt, lineJoin: .miter, miterLimit: 0)
				let alpha = self.isHighlighted ? 0.5 : 0.3
				l.fillColor = self.tintColor.withAlphaComponent(CGFloat(alpha)).cgColor
				// label
				t.alpha = self.isHighlighted ? 1 : 0.7
			}
		}
	}
	
	func changeState(checked: Bool?, highlighted: Bool?) {
		if let checked = checked {
			isChecked = checked
		}
		if let highlighted = highlighted {
			isHighlighted = highlighted
		}
		redrawCheckboxForCurrentState()
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		changeState(checked: nil, highlighted: true)
	}
	
	override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
		isHighlighted = false
		
		if isChecked && shouldUncheckOnSelection {
			isChecked = false
		} else if !isChecked {
			isChecked = true
		}
		
		onTouchCallback?(self)
		
		redrawCheckboxForCurrentState()
	}
	
	override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
		changeState(checked: nil, highlighted: false)
	}
	
	override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
		invalidateIntrinsicContentSize()
		super.traitCollectionDidChange(previousTraitCollection)
		redrawCheckboxForCurrentState()
		box.snp.remakeConstraints { make in
			make.left.equalToSuperview()
			make.centerY.equalToSuperview()
			make.width.equalTo(intrinsicHeight)
			make.height.equalTo(intrinsicHeight)
		}
	}
	
	override func updateConstraints() {
		// let em = UIFont.systemFontSize
		
		titleLabel.snp.makeConstraints { make in
			make.left.equalTo(box.snp.right)
			make.right.equalToSuperview()
			make.centerY.equalToSuperview()
		}
		
		super.updateConstraints()
	}

}
