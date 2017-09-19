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
import SnapKit

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
			
			// Create a blank 1x1 image rather than a blank 0x0 image for
			// animation purposes (cannot divide by zero)
			UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
			iv.image = UIGraphicsGetImageFromCurrentImageContext()
			UIGraphicsEndImageContext()
			
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
	
	override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
		let em = UIFont.systemFontSize
		lessonImage.snp.remakeConstraints { make in
			switch traitCollection.verticalSizeClass {
			case .compact:
				make.left.equalTo(lessonCard.snp.leftMargin)
				make.top.equalTo(lessonCard.snp.top).offset(1*em)
				make.bottom.equalTo(lessonCard.snp.bottom).offset(-1*em)
				make.width.equalToSuperview().multipliedBy(0.4)
			case .regular:
				make.height.equalToSuperview().multipliedBy(0.3)
				make.left.equalTo(lessonCard.snp.leftMargin)
				make.right.equalTo(lessonCard.snp.rightMargin)
				make.top.equalTo(lessonCard.snp.top).offset(1*em)
			default:
				print("Unknown size class")
			}
		}
	}
	
	override func updateConstraints() {
		let em = UIFont.systemFontSize
		
		lessonCard.snp.makeConstraints { make in
			let margin = UIEdgeInsets(top: 0,
			                          left: 1*em,
			                          bottom: 1*em,
			                          right: 1*em)
			make.edges.equalToSuperview().inset(margin)
		}
		
		nextButton.snp.makeConstraints { make in
			make.rightMargin.equalToSuperview()
			make.bottomMargin.equalToSuperview()
		}
		
		
		super.updateConstraints()
	}
}
