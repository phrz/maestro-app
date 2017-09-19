//
//  LessonContentView.swift
//  Maestro
//
//  Created by Kena Du on 9/3/17.
//  Copyright © 2017 Maestro. All rights reserved.
//

import UIKit
import AVFoundation
import UIImageViewAlignedSwift

class LessonContentView: LessonCardView {
	
    let lessonDetail: UILabel
    
	//let audioPlayer: AudioPlayerView

	override init(frame: CGRect) {
        
        lessonDetail = {
            let d = UILabel()
            d.numberOfLines = 0
            d.lineBreakMode = .byWordWrapping
            d.textColor = .black
            d.text = "lessonDetail"
            return d
        }()
        
		//audioPlayer = AudioPlayerView()
		
		super.init(frame: frame)
		
        lessonCard.addSubview(lessonDetail)
        //lessonCard.addSubview(audioPlayer)
		
        updateConstraints()
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
	
	override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
		let em = UIFont.systemFontSize
		lessonDetail.snp.remakeConstraints { make in
			
			make.right.equalTo(lessonCard.snp.rightMargin)
			make.bottom.lessThanOrEqualTo(nextButton.snp.top)
			
			switch traitCollection.verticalSizeClass {
			case .compact:
				make.top.equalToSuperview().offset(1*em)
				make.left.equalTo(lessonImage.snp.right).offset(1*em)
			case .regular:
				make.top.equalTo(lessonImage.snp.bottom).offset(1*em)
				make.left.equalTo(lessonCard.snp.leftMargin)
			default:
//				print("Unknown size class")
				break
			}
		}
		super.traitCollectionDidChange(previousTraitCollection)
	}
    
    override func updateConstraints() {
//        let em = UIFont.systemFontSize
		super.updateConstraints()
    }
}
