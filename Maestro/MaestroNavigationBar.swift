//
//  MaestroNavigationBar.swift
//  Maestro
//
//  Created by Paul Herz on 9/1/17.
//  Copyright © 2017 Maestro. All rights reserved.
//

import UIKit

class MaestroNavigationBar: UINavigationBar {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = .white
		isTranslucent = false
		setBackgroundImage(UIImage(), for: .default)
		shadowImage = UIImage()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}
