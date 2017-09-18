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
	let quizTextContainer: UIView = UIView()
	
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
		
		quizAnswers = {
			let a = CheckboxListView(frame: .zero)
			return a
		}()
		
		super.init(frame: frame)
		isUserInteractionEnabled = true
		
		lessonImage.image = #imageLiteral(resourceName: "staff")
		
		lessonCard.addSubview(quizTextContainer)
		quizTextContainer.addSubview(quizQuestion)
		quizTextContainer.addSubview(quizAnswers)
		
		updateConstraints()
		
	}
	
	required init(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
		let em = UIFont.systemFontSize
		
		quizTextContainer.snp.remakeConstraints { make in
			switch traitCollection.verticalSizeClass {
			case .compact:
				make.top.greaterThanOrEqualToSuperview().offset(1*em)
				make.left.equalTo(lessonImage.snp.right).offset(1*em)
				make.centerYWithinMargins.equalToSuperview().offset(-1*em).priority(50)
			case .regular:
				make.top.equalTo(lessonImage.snp.bottom).offset(2*em)
				make.left.equalTo(lessonCard.snp.leftMargin)
			default:
				print("Unknown size class")
			}
			make.right.equalTo(lessonCard.snp.rightMargin)
		}
		
		quizQuestion.snp.remakeConstraints { make in
			make.left.equalToSuperview()
			make.right.equalToSuperview()
			make.top.equalToSuperview()
		}
		
		quizAnswers.snp.remakeConstraints { make in
			make.top.equalTo(quizQuestion.snp.bottom).offset(1*em)
			make.left.equalToSuperview()
			make.right.equalToSuperview()
			make.bottom.equalToSuperview()
		}
		
		super.traitCollectionDidChange(previousTraitCollection)
	}
	
//	override func updateConstraints() {
//		let em = UIFont.systemFontSize
//		super.updateConstraints()
//	}

}
