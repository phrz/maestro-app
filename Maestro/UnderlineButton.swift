//
//  UnderlineButton.swift
//  Maestro
//
//  Created by Paul Herz on 8/31/17.
//  Copyright © 2017 Maestro. All rights reserved.
//

import UIKit

class UnderlineButton: UIButton {
	
	private static let normalColor: UIColor = .black
	
	override var isEnabled: Bool {
		didSet {
			if isEnabled {
				alpha = 1
			} else {
				alpha = 0.4
			}
		}
	}
	
	override init(frame: CGRect) {
		let em = UIFont.systemFontSize
		super.init(frame: frame)
		
		self.setTitleColor(type(of: self).normalColor, for: .normal)
		
		contentEdgeInsets = UIEdgeInsetsMake(em, em, em, em)
		
		for event in [UIControlEvents.touchDown, UIControlEvents.touchDragEnter] {
			addTarget(self, action: #selector(self.didBeginHighlighting), for: event)
		}
		
		for event in [UIControlEvents.touchUpInside, UIControlEvents.touchDragExit] {
			addTarget(self, action: #selector(self.didStopHighlighting), for: event)
		}
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func setTitle(_ title: String?, for state: UIControlState) {
		super.setTitle(title, for: state)
		self.sizeToFit()
	}
	
	override func draw(_ rect: CGRect) {
		guard
			let textRect = self.titleLabel?.frame,
			let ctx = UIGraphicsGetCurrentContext()
		else {
				return
		}
		
		let alpha = CGFloat(isHighlighted ? 0.1 : 0.2)
		
		ctx.saveGState()
		let rect = CGRect(x: textRect.minX, y: textRect.maxY, width: textRect.width, height: 3)
		let path = CGPath(rect: rect, transform: nil)
		ctx.addPath(path)
		let color = UIColor(white: 0, alpha: alpha)
		ctx.setFillColor(color.cgColor)
		ctx.closePath()
		ctx.fillPath()
		ctx.restoreGState()
	}
	
	func didBeginHighlighting() {
		UIView.animate(withDuration: 0.1) {
			self.alpha = 0.5
		}
	}
	
	func didStopHighlighting() {
		UIView.animate(withDuration: 0.1) {
			self.alpha = 1
		}
	}

}
