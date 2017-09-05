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
    var player:AVPlayer?
    var playerItem:AVPlayerItem?

    
    

    
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
            let screenSize: CGRect = UIScreen.main.bounds
            let vImg = UIImageView()
            vImg.frame = CGRect(x: 0, y: 0, width: 5, height: screenSize.height * 0.01)
            let i = UIImage(named:"The-Staff.jpg")
            vImg.image = i
            vImg.translatesAutoresizingMaskIntoConstraints = false
            return vImg
        }()
        
        lessonDetail = {
            let d = UILabel()
            d.numberOfLines = 0
            d.lineBreakMode = .byWordWrapping
            d.textColor = UIColor(white: 0, alpha: 0.6)
            d.text = "The staff consists of five lines and four spaces. Each of those lines and each of those spaces represents a different letter, which in turn represents a note. Those lines and spaces represent notes named A-G, and the note sequence moves alphabetically up the staff."
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
        
        /*playButton = {
            let p = UnderlineButton()
                //UIButton(type: UIButtonType.system) as UIButton
            let url = URL(string: "https://s3.amazonaws.com/kargopolov/kukushka.mp3")
            let playerItem:AVPlayerItem = AVPlayerItem(url: url!)
            player = AVPlayer(playerItem: playerItem)
            let playerLayer=AVPlayerLayer(player: player!)
            playerLayer.frame=CGRect(x:0, y:0, width:10, height:50)
            p.setTitle("Play", for: .normal)
            p.addTarget(self, action: #selector(playButtonTapped(_:)), for: .touchUpInside)
            
            return p
        }()*/
        playButton = UIButton(type: UIButtonType.system) as UIButton
        let url = URL(string: "https://s3.amazonaws.com/kargopolov/kukushka.mp3")
        let playerItem:AVPlayerItem = AVPlayerItem(url: url!)
        player = AVPlayer(playerItem: playerItem)
        let playerLayer=AVPlayerLayer(player: player!)
        playerLayer.frame=CGRect(x:0, y:0, width:10, height:50)
        playButton!.frame = CGRect(x: 10, y: 10, width: 60, height: 30)
        playButton!.backgroundColor = UIColor.lightGray
        playButton!.setTitle("Play", for: UIControlState.normal)
        playButton!.tintColor = UIColor.black
        //button is not responding
        playButton.addTarget(self, action: #selector(self.playButtonTapped(_:)), for: .touchUpInside)
        
        
        lessonAudio.addSubview(playButton)
        lessonCard.addSubview(lessonImage)
        lessonCard.addSubview(lessonDetail)
        lessonCard.addSubview(lessonAudio)
        lessonCard.addSubview(nextButton)
        addSubview(lessonCard)
        
        updateConstraints()
        
    }
    
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func playButtonTapped(_ sender:UIButton)
    {
        NSLog("pressed!")
        print("here it plays")
        if player?.rate == 0
        {
            
            player!.play()
            //playButton!.setImage(UIImage(named: "player_control_pause_50px.png"), forState: UIControlState.Normal)
            playButton!.setTitle("Pause", for: UIControlState.normal)
        } else {
            player!.pause()
            //playButton!.setImage(UIImage(named: "player_control_play_50px.png"), forState: UIControlState.Normal)
            playButton!.setTitle("Play", for: UIControlState.normal)
        }
        
        
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
            make.edges.equalTo(lessonCard).inset(UIEdgeInsetsMake(2, 20, 400, 20))
        }

        lessonDetail.snp.makeConstraints { (make) in
            make.top.equalTo(lessonImage.snp.bottomMargin).offset(6*em)
            make.left.equalTo(lessonCard.snp.leftMargin)
            make.right.equalTo(lessonCard.snp.rightMargin)
        }
        
        lessonAudio.snp.makeConstraints { (make) in
            make.top.equalTo(lessonDetail.snp.bottomMargin).offset(2*em)
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
