//
//  LessonContentViewController.swift
//  Maestro
//
//  Created by Kena Du on 9/3/17.
//  Copyright © 2017 Maestro. All rights reserved.
//

import UIKit
import MediaPlayer
import AudioToolbox
import AVFoundation

class LessonContentViewController: UIViewController {
    var playButton: UIButton!
    var player:AVPlayer?
    var playerItem:AVPlayerItem?
    

    
    var lessonContentView: LessonContentView{
        return view as! LessonContentView
    }
    
    override func loadView() {
        view = LessonContentView(frame: UIScreen.main.bounds)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
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

        self.view.addSubview(playButton)
    }
    
    func playButtonTapped(_ sender:UIButton)
    {
        NSLog("pressed!")
        print("here it plays")
        if player?.rate == 0
        {
            
            player!.play()
            playButton!.setImage(UIImage(named: "pause.png"), for: UIControlState.normal)
            //playButton!.setTitle("Pause", for: UIControlState.normal)
        } else {
            player!.pause()
            playButton!.setImage(UIImage(named: "play.png"), for: UIControlState.normal)
            //playButton!.setTitle("Play", for: UIControlState.normal)
        }
        
        
    }

        // Do any additional setup after loading the view.

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
