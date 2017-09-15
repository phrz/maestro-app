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
	let checkLayer: CAShapeLayer
	
	private(set) var isChecked: Bool = false
	private(set) var isHighlighted: Bool = false
	var shouldUncheckOnSelection: Bool = true
	
	var onTouchCallback: ((CheckboxItemView) -> Void)? = nil
	
	override var intrinsicContentSize: CGSize {
		return CGSize(width: UIViewNoIntrinsicMetric, height: 50)
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
		checkLayer = {
			let c = CAShapeLayer()
			c.path = UIBezierPath(ovalIn: CGRect(x: 20, y: 20, width: 10, height: 10)).cgPath
			c.strokeColor = UIColor.clear.cgColor
			c.fillColor = UIColor.clear.cgColor
			return c
		}()
		box.layer.addSublayer(boxLayer)
		box.layer.addSublayer(checkLayer)
		
		super.init(frame: frame)
		
		setBoxLayerForState()
		isUserInteractionEnabled = true
		addSubview(titleLabel)
		addSubview(box)
		updateConstraints()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func setBoxLayerForState() {
		DispatchQueue.main.async {
			let l = self.boxLayer
			l.strokeColor = UIColor.clear.cgColor
			
			let c = self.checkLayer
			if self.isChecked {
				// check
				c.fillColor = UIColor.white.cgColor
				// box
				let path = UIBezierPath(ovalIn: CGRect(x: 7, y: 7, width: 36, height: 36))
				l.path = path.cgPath
				let alpha = self.isHighlighted ? 0.6 : 1
				l.fillColor = UIColor(white: 0, alpha: CGFloat(alpha)).cgColor
			} else {
				// check
				c.fillColor = UIColor.clear.cgColor
				// box
				let path = UIBezierPath(ovalIn: CGRect(x: 10, y: 10, width: 30, height: 30))
				l.path = path.cgPath.copy(strokingWithWidth: 3, lineCap: .butt, lineJoin: .miter, miterLimit: 0)
				let alpha = self.isHighlighted ? 0.5 : 0.3
				l.fillColor = UIColor(white: 0, alpha: CGFloat(alpha)).cgColor
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
		setBoxLayerForState()
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
		
		setBoxLayerForState()
	}
	
	override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
		changeState(checked: nil, highlighted: false)
	}
	
	override func updateConstraints() {
		// let em = UIFont.systemFontSize
		
		box.snp.makeConstraints { make in
			make.left.equalToSuperview()
			make.height.equalTo(50)
			make.width.equalTo(box.snp.height)
			make.centerY.equalToSuperview()
		}
		
		titleLabel.snp.makeConstraints { make in
			make.left.equalTo(box.snp.right)
			make.right.equalToSuperview()
			make.centerY.equalToSuperview()
		}
		
		super.updateConstraints()
	}

}
