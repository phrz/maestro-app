//
//  LessonCardView.swift
//  Maestro
//
//  Created by Paul Herz on 9/13/17.
//  Copyright © 2017 Maestro. All rights reserved.
//

import UIKit
import AVFoundation
import UIImageViewAlignedSwift

class LessonCardView: UIView {

	let lessonCard: UIView
	let lessonImage: UIImageViewAligned
	let nextButton: UIButton
	
	override init(frame: CGRect) {
		lessonCard = {
			let em = UIFont.systemFontSize
			let l = UIView()
			l.layoutMargins = UIEdgeInsets(top: 3*em, left: 1*em, bottom: 1*em, right: 1*em)
			l.backgroundColor = UIColor(white: 0.93, alpha: 1) // #F3F3F3
			return l
		}()
		
		lessonImage = {
			let iv = UIImageViewAligned()
			iv.contentMode = .scaleAspectFit
			iv.alignment = .center
			return iv
		}()
		
		nextButton = {
			let b = UnderlineButton(frame: .zero)
			b.setTitle("Next", for: .normal)
			return b
		}()
		
		super.init(frame: frame)
		backgroundColor = .white
		
		lessonCard.addSubview(lessonImage)
		lessonCard.addSubview(nextButton)
		
		addSubview(lessonCard)
	}
	
	required init(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func updateConstraints() {
		let em = UIFont.systemFontSize
		//		let statusBarHeight = UIApplication.shared.statusBarFrame.height
		
		lessonCard.snp.makeConstraints { make in
			let margin = UIEdgeInsets(top: 0,
			                          left: 1*em,
			                          bottom: 1*em,
			                          right: 1*em)
			make.edges.equalToSuperview().inset(margin)
		}
		
		lessonImage.snp.makeConstraints { make -> Void in
			make.height.equalToSuperview().multipliedBy(0.3)
			make.left.equalTo(lessonCard.snp.leftMargin)
			make.right.equalTo(lessonCard.snp.rightMargin)
			make.top.equalTo(lessonCard.snp.top).offset(1*em)
		}
		
		nextButton.snp.makeConstraints { make in
			make.rightMargin.equalToSuperview()
			make.bottomMargin.equalToSuperview()
		}
		
		
		super.updateConstraints()
	}
}
