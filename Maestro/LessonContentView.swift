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

class LessonContentView: UIView {
    
    let lessonCard: UIView
    let lessonImage: UIImageViewAligned
    let lessonDetail: UILabel
    let nextButton: UIButton
    
	let audioPlayer: AudioPlayerView

    override init(frame: CGRect) {
        
        lessonCard = {
            let em = UIFont.systemFontSize
            let l = UIView()
            l.layoutMargins = UIEdgeInsets(top: 3*em, left: 1*em, bottom: 1*em, right: 1*em)
            l.backgroundColor = UIColor(white: 0.95, alpha: 1) // #F3F3F3
            return l
        }()
        
        lessonImage = {
            let iv = UIImageViewAligned()
            iv.image = UIImage(named:"staff")
			iv.contentMode = .scaleAspectFit
			iv.alignment = .top
            return iv
        }()
        
        lessonDetail = {
            let d = UILabel()
            d.numberOfLines = 0
            d.lineBreakMode = .byWordWrapping
            d.textColor = .black
            d.text = "The staff consists of five lines and four spaces. Each of those lines and each of those spaces represents a different letter, which in turn represents a note. Those lines and spaces represent notes named A-G, and the note sequence moves alphabetically up the staff."
            return d
        }()
        
        nextButton = {
            let b = UnderlineButton(frame: .zero)
            b.setTitle("Next", for: .normal)
            return b
        }()
        
		audioPlayer = AudioPlayerView()
		
		super.init(frame: frame)
		backgroundColor = .white
        
        lessonCard.addSubview(lessonImage)
        lessonCard.addSubview(lessonDetail)
        lessonCard.addSubview(nextButton)
        
        lessonCard.addSubview(audioPlayer)
        addSubview(lessonCard)
        
        updateConstraints()
        
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
			make.height.lessThanOrEqualTo(lessonCard).multipliedBy(0.3)
            make.left.equalTo(lessonCard.snp.leftMargin)
			make.right.equalTo(lessonCard.snp.rightMargin)
			make.top.equalTo(lessonCard.snp.top).offset(1*em)
        }
		
		audioPlayer.snp.makeConstraints { make -> Void in
			make.top.equalTo(lessonImage.snp.bottom).offset(0.5*em)
			make.left.equalTo(lessonCard.snp.leftMargin)
			make.right.equalTo(lessonCard.snp.rightMargin)
		}

        lessonDetail.snp.makeConstraints { make in
            make.top.equalTo(audioPlayer.snp.bottom).offset(0.25*em)
            make.left.equalTo(lessonCard.snp.leftMargin)
            make.right.equalTo(lessonCard.snp.rightMargin)
        }
        
        nextButton.snp.makeConstraints { make in
            make.rightMargin.equalToSuperview()
            make.bottomMargin.equalToSuperview()
        }
        
        
        super.updateConstraints()
    }
}
