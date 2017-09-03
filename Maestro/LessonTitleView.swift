//
//  LessonTitleView.swift
//  Maestro
//
//  Created by Paul Herz on 8/31/17.
//  Copyright © 2017 Maestro. All rights reserved.
//

import UIKit
import UIImageViewAlignedSwift

class LessonTitleView: UIView {
	
	let lessonCard: UIView
	let lessonDetail: UILabel
	let lessonTitle: UILabel
	let lessonIcon: UIImageViewAligned
	let startButton: UIButton
	
	override init(frame: CGRect) {
		lessonCard = {
			let em = UIFont.systemFontSize
			let l = UIView()
			l.layoutMargins = UIEdgeInsets(top: 3*em, left: 1*em, bottom: 1*em, right: 1*em)
			l.backgroundColor = UIColor(white: 0.95, alpha: 1) // #F3F3F3
			return l
		}()
		
		lessonDetail = {
			let d = UILabel()
			d.numberOfLines = 0 // Auto
			d.lineBreakMode = .byWordWrapping
			d.textColor = UIColor(white: 0, alpha: 0.6)
			d.text = "INTRODUCTION · LESSON 1"
			return d
		}()
		
		lessonTitle = {
			let t = UILabel()
			let em = UIFont.systemFontSize
			t.numberOfLines = 0 // Auto
			t.lineBreakMode = .byWordWrapping
			t.font = UIFont.systemFont(ofSize: 2.5*em)
			t.text = "Quarter, Half, and Whole Notes"
			return t
		}()
		
		lessonIcon = {
			let i = UIImage(imageLiteralResourceName: "quarter-note")
			let iv = UIImageViewAligned(image: i)
			iv.contentMode = .scaleAspectFit
			iv.alignment = .topLeft
			return iv
		}()
		
		startButton = {
			let b = UnderlineButton()
			b.setTitle("Start", for: .normal)
			return b
		}()
		
		super.init(frame: frame)
		lessonCard.addSubview(lessonDetail)
		lessonCard.addSubview(lessonTitle)
		lessonCard.addSubview(lessonIcon)
		lessonCard.addSubview(startButton)
		addSubview(lessonCard)
		
		updateConstraints()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func updateConstraints() {
		let em = UIFont.systemFontSize
//		let statusBarHeight = UIApplication.shared.statusBarFrame.height
		
		lessonCard.snp.makeConstraints { (make) in
			let margin = UIEdgeInsets(top: 0,
			                          left: 1*em,
			                          bottom: 1*em,
			                          right: 1*em)
			make.edges.equalToSuperview().inset(margin)
		}
		
		lessonDetail.snp.makeConstraints { (make) in
			make.top.equalTo(lessonCard.snp.topMargin)
			make.left.equalTo(lessonCard.snp.leftMargin)
			make.right.equalTo(lessonCard.snp.rightMargin)
		}
		
		lessonTitle.snp.makeConstraints { (make) in
			make.top.equalTo(lessonDetail.snp.bottom).offset(0.5*em)
			make.left.equalTo(lessonCard.snp.leftMargin)
			make.right.equalTo(lessonCard.snp.rightMargin)
		}
		
		lessonIcon.snp.makeConstraints { (make) in
			make.top.equalTo(lessonTitle.snp.bottom).offset(2*em)
			make.left.equalTo(lessonCard.snp.leftMargin)
			make.height.equalTo(64)
			make.width.lessThanOrEqualToSuperview()
		}
		
		startButton.snp.makeConstraints { (make) in
			make.rightMargin.equalToSuperview()
			make.bottomMargin.equalToSuperview()
		}
		
		super.updateConstraints()
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
	}

}
