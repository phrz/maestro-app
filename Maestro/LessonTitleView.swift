//
//  LessonTitleView.swift
//  Maestro
//
//  Created by Paul Herz on 8/31/17.
//  Copyright © 2017 Maestro. All rights reserved.
//

import UIKit

class LessonTitleView: UIView {
	
	var lessonCard: UIView!
	var lessonDetail: UILabel!
	var lessonTitle: UILabel!
	var startButton: UIButton!
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
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
			d.text = "Introduction · Lesson 1"
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
		
		startButton = {
			let b = UnderlineButton()
			b.setTitle("Start", for: .normal)
			return b
		}()
		
		lessonCard.addSubview(lessonDetail)
		lessonCard.addSubview(lessonTitle)
		lessonCard.addSubview(startButton)
		addSubview(lessonCard)
		
		updateConstraints()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func updateConstraints() {
		let em = UIFont.systemFontSize
		let statusBarHeight = UIApplication.shared.statusBarFrame.height
		
		lessonCard.snp.makeConstraints { (make) in
			let topMargin = 3.3*em + statusBarHeight
			let margin = UIEdgeInsets(top: topMargin,
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
		
		startButton.snp.makeConstraints { (make) in
			make.rightMargin.equalToSuperview()
			make.bottomMargin.equalToSuperview()
		}
		
		super.updateConstraints()
	}

}
