//
//  LessonCompletionView.swift
//  Maestro
//
//  Created by Paul Herz on 9/18/17.
//  Copyright © 2017 Maestro. All rights reserved.
//

import UIKit

class LessonCompletionView: LessonCardView {

	let completionLabel: UILabel
	
	override init(frame: CGRect) {
		completionLabel = {
			let c = UILabel(frame: .zero)
			c.numberOfLines = 0
			c.lineBreakMode = .byWordWrapping
			c.textColor = .black
			c.font = UIFont.systemFont(ofSize: UIFont.systemFontSize * 2)
			c.text = "Congrats!\nYou completed\nLesson \(LessonRouter.shared.currentLesson!.index)"
			c.textAlignment = .center
			return c
		}()
		super.init(frame: frame)
		hasImage = true
		lessonImage.image = UIImage(named: "medal")
		lessonCard.addSubview(completionLabel)
		setNeedsUpdateConstraints()
	}
	
	required init(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
		let em = UIFont.systemFontSize
		completionLabel.snp.remakeConstraints { make in
			make.right.equalTo(lessonCard.snp.rightMargin)
			switch traitCollection.verticalSizeClass {
			case .compact:
				make.centerYWithinMargins.equalToSuperview()
				make.left.equalTo(lessonImage.snp.right).offset(1*em)
			case .regular:
				make.top.equalTo(lessonImage.snp.bottom).offset(3*em)
				make.left.equalTo(lessonCard.snp.leftMargin)
			default:
				break
			}
		}
		super.traitCollectionDidChange(previousTraitCollection)
	}
}
