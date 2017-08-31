//
//  UnderlineButton.swift
//  Maestro
//
//  Created by Paul Herz on 8/31/17.
//  Copyright © 2017 Maestro. All rights reserved.
//

import UIKit

class UnderlineButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.setTitleColor(.black, for: .normal)
		self.sizeToFit()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func draw(_ rect: CGRect) {
		guard
			let textRect = self.titleLabel?.frame,
			let ctx = UIGraphicsGetCurrentContext()
		else {
				return
		}
		
		ctx.saveGState()
		let rect = CGRect(x: textRect.minX, y: textRect.maxY, width: textRect.width, height: 3)
		let path = CGPath(rect: rect, transform: nil)
		ctx.addPath(path)
		let color = UIColor(white: 0, alpha: 0.2)
		ctx.setFillColor(color.cgColor)
		ctx.closePath()
		ctx.fillPath()
		ctx.restoreGState()
	}

}
