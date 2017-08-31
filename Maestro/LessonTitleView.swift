//
//  LessonTitleView.swift
//  Maestro
//
//  Created by Paul Herz on 8/31/17.
//  Copyright © 2017 Maestro. All rights reserved.
//

import UIKit

class LessonTitleView: UIView {
	
	var testLabel: UILabel!
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		testLabel = {
			let t = UILabel()
			t.backgroundColor = .lightGray
			t.text = "🖐🌎"
			t.textAlignment = .center
			return t
		}()
		
		addSubview(testLabel)
		updateConstraints()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func updateConstraints() {
		testLabel.snp.makeConstraints { (make) in
			make.width.equalTo(200)
			make.height.equalTo(60)
			make.center.equalTo(self)
		}
		super.updateConstraints()
	}

}
