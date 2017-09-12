//
//  LessonContentView.swift
//  Maestro
//
//  Created by Kena Du on 9/3/17.
//  Copyright © 2017 Maestro. All rights reserved.
//

import UIKit
import MediaPlayer
import AudioToolbox
import AVFoundation


class LessonContentView: UIView {
    
    let lessonCard: UIView
    let lessonImage: UIImageView
    let lessonDetail: UILabel
    let nextButton: UIButton
    
    let audioPlayerPlayButton: UIButton
    let audioPlayerSlider: UISlider

    override init(frame: CGRect) {
        
        lessonCard = {
            let em = UIFont.systemFontSize
            let l = UIView()
            l.layoutMargins = UIEdgeInsets(top: 3*em, left: 1*em, bottom: 1*em, right: 1*em)
            l.backgroundColor = UIColor(white: 0.95, alpha: 1) // #F3F3F3
            return l
        }()
        
        lessonImage = {
            let iv = UIImageView()
            iv.image = UIImage(named:"The-Staff.jpg")
			iv.contentMode = .scaleAspectFit
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
            let b = UnderlineButton()
            b.setTitle("Next", for: .normal)
            return b
        }()
        
        audioPlayerPlayButton = {
            let p = UIButton()
            p.setImage(UIImage.init(named: "play-icon"), for: .normal)
            p.backgroundColor = .clear
            p.tintColor = .black
            return p
        }()
        
        audioPlayerSlider = {
            let s = UISlider()
            s.minimumValue = 0
            return s
        }()
		
		super.init(frame: frame)
		backgroundColor = .white
		
		audioPlayerPlayButton.addTarget(self, action: #selector(self.playButtonTapped(sender:)), for: .touchUpInside)
        
        lessonCard.addSubview(lessonImage)
        lessonCard.addSubview(lessonDetail)
        lessonCard.addSubview(nextButton)
        
        lessonCard.addSubview(audioPlayerPlayButton)
		lessonCard.addSubview(audioPlayerSlider)
        addSubview(lessonCard)
        
        updateConstraints()
        
    }
    
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
	
	func playButtonTapped(sender: Any) {
		print("Play Button Tapped")
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
        
        lessonImage.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(lessonCard.snp.leftMargin)
			make.right.equalTo(lessonCard.snp.rightMargin)
			make.top.equalTo(lessonCard.snp.top).offset(1*em)
        }

        lessonDetail.snp.makeConstraints { (make) in
            make.top.equalTo(audioPlayerPlayButton.snp.bottom).offset(1*em)
            make.left.equalTo(lessonCard.snp.leftMargin)
            make.right.equalTo(lessonCard.snp.rightMargin)
        }
        
        audioPlayerPlayButton.snp.makeConstraints { make in
			make.top.equalTo(lessonImage.snp.bottom).offset(1*em)
			make.left.equalTo(lessonCard.snp.leftMargin)
            make.width.equalTo(40)
            make.height.equalTo(40)
        }
        
        audioPlayerSlider.snp.makeConstraints { make in
			make.centerY.equalTo(audioPlayerPlayButton.snp.centerY)
            make.left.equalTo(audioPlayerPlayButton.snp.right)
			make.right.equalTo(lessonCard.snp.rightMargin)
        }
        
        nextButton.snp.makeConstraints { (make) in
            make.rightMargin.equalToSuperview()
            make.bottomMargin.equalToSuperview()
        }
        
        
        super.updateConstraints()
    }
}
