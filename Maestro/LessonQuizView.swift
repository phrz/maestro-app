//
//  LessonQuizView.swift
//  Maestro
//
//  Created by Paul Herz on 9/14/17.
//  Copyright © 2017 Maestro. All rights reserved.
//

import UIKit

class LessonQuizView: LessonCardView {
	
	let quizQuestion: UILabel
	let quizAnswers: CheckboxListView
	
	override init(frame: CGRect) {
		
		quizQuestion = {
			let d = UILabel()
			d.numberOfLines = 0
			d.lineBreakMode = .byWordWrapping
			d.textColor = .black
			d.font = UIFont.systemFont(ofSize: UIFont.systemFontSize * 1.5)
			d.text = "The staff consists of five lines and four spaces?"
			return d
		}()
		
		quizAnswers = CheckboxListView(frame: .zero)
		
		super.init(frame: frame)
		isUserInteractionEnabled = true
		
		lessonImage.image = #imageLiteral(resourceName: "staff")
		
		lessonCard.addSubview(quizQuestion)
		lessonCard.addSubview(quizAnswers)
		
		updateConstraints()
		
	}
	
	required init(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func updateConstraints() {
		
		let em = UIFont.systemFontSize
		
		quizQuestion.snp.makeConstraints { make in
			make.top.equalTo(lessonImage.snp.bottom).offset(2*em)
			make.left.equalTo(lessonCard.snp.leftMargin)
			make.right.equalTo(lessonCard.snp.rightMargin)
		}
		
		quizAnswers.snp.makeConstraints { make in
			make.left.equalTo(lessonCard.snp.leftMargin)
			make.right.equalTo(lessonCard.snp.rightMargin)
			make.top.equalTo(quizQuestion.snp.bottom).offset(1*em)
		}
		
		super.updateConstraints()
	}

}
