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
    
	let audioPlayer: AudioPlayerView

	override init(frame: CGRect) {
        
        lessonDetail = {
            let d = UILabel()
            d.numberOfLines = 0
            d.lineBreakMode = .byWordWrapping
            d.textColor = .black
            d.text = "The staff consists of five lines and four spaces. Each of those lines and each of those spaces represents a different letter, which in turn represents a note. Those lines and spaces represent notes named A-G, and the note sequence moves alphabetically up the staff."
            return d
        }()
        
		audioPlayer = AudioPlayerView()
		
		super.init(frame: frame)
		
		lessonImage.image = #imageLiteral(resourceName: "staff")
		
        lessonCard.addSubview(lessonDetail)
        lessonCard.addSubview(audioPlayer)
		
        updateConstraints()
        
    }
    
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
		
        let em = UIFont.systemFontSize
		
		audioPlayer.snp.makeConstraints { make -> Void in
			make.centerY.equalTo(nextButton)
			make.left.equalTo(lessonCard.snp.leftMargin)
			make.right.equalTo(nextButton.snp.left).offset(-1*em)
		}
		
        lessonDetail.snp.makeConstraints { make in
            make.top.equalTo(lessonImage.snp.bottom).offset(2*em)
            make.left.equalTo(lessonCard.snp.leftMargin)
            make.right.equalTo(lessonCard.snp.rightMargin)
        }
		
		super.updateConstraints()
    }
}
