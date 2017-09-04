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
    
    var lessonCard: UIView!
    var lessonImage: UIImageView!
    var lessonDetail: UILabel!
    var lessonAudio: UIView!
    var nextButton: UIButton!
    var playButton: UIButton!
    
    
    var player : AVAudioPlayer?
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        lessonCard = {
            let em = UIFont.systemFontSize
            let l = UIView()
            l.layoutMargins = UIEdgeInsets(top: 3*em, left: 1*em, bottom: 1*em, right: 1*em)
            l.backgroundColor = UIColor(white: 0.95, alpha: 1) // #F3F3F3
            return l
        }()
        
        lessonImage = {
            let em = UIFont.systemFontSize
            let i = UIImage()
            let vImg = UIImageView(image: i);
            vImg.layoutMargins = UIEdgeInsets(top: 3*em, left: 1*em, bottom: 5*em, right: 1*em)
            return vImg
        }()
        
        lessonDetail = {
            let d = UILabel()
            d.numberOfLines = 0
            d.lineBreakMode = .byWordWrapping
            d.textColor = UIColor(white: 0, alpha: 0.6)
            d.text = "Here is the lesson Detail"
            return d
        }()
        
        lessonAudio = {
            let em = UIFont.systemFontSize
            let a = UIView()
            a.layoutMargins = UIEdgeInsets(top: 7*em, left: 1*em, bottom: 1*em, right: 1*em)
            a.backgroundColor = UIColor(white: 0.95, alpha: 1) // #F3F3F3
            
            return a
        }()
        
        nextButton = {
            let b = UnderlineButton()
            b.setTitle("Next", for: .normal)
            return b
        }()
        
        playButton = {
            let p = UnderlineButton()
            p.setTitle("Play", for: .normal)
            playSound()
            return p
        }()
        
        lessonAudio.addSubview(playButton)
        lessonCard.addSubview(lessonImage)
        lessonCard.addSubview(lessonDetail)
        lessonCard.addSubview(nextButton)
        addSubview(lessonCard)
        
        updateConstraints()
        
    }
    
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func playSound() {
        let url = Bundle.main.url(forResource: "ClickSound", withExtension: "mp3")!
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
            
            player.prepareToPlay()
            player.play()
        } catch let error as NSError {
            print(error.description)
        }
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
        
        lessonImage.snp.makeConstraints { (make) in
            make.top.equalTo(lessonDetail.snp.bottom).offset(0.5*em)
            make.left.equalTo(lessonCard.snp.leftMargin)
            make.right.equalTo(lessonCard.snp.rightMargin)
        }
        
        nextButton.snp.makeConstraints { (make) in
            make.rightMargin.equalToSuperview()
            make.bottomMargin.equalToSuperview()
        }
        
        super.updateConstraints()
    }
}
