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
    
    var audioPlayer: AVPlayer
    var audioContent: AVPlayerItem
    
    var lessonContentView: LessonContentView {
        return view as! LessonContentView
    }
    
    override func loadView() {
        view = LessonContentView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let audioContentURL = URL(string: "https://s3.amazonaws.com/kargopolov/kukushka.mp3")!
        audioContent = AVPlayerItem(url: audioContentURL)
        audioPlayer = AVPlayer(playerItem: audioContent)
        
        setupPlaybackSlider()
    }
    
    func setupPlaybackSlider() {
        let duration : CMTime = audioContent.asset.duration
        let seconds : Float64 = CMTimeGetSeconds(duration)
        
        let s = lessonContentView.audioPlayerSlider
        s.maximumValue = Float(seconds)
        s.isContinuous = false
        s.tintColor = UIColor.darkGray
        
        // When the user modifies the slider, change the
        // playback position.
        s.addTarget(self, action: #selector(playbackSliderValueChanged(_:)), for: .valueChanged)
        
        // Every second, advance the slider.
        let everySecond = CMTime(seconds: 1, preferredTimescale: 1)
        
        audioPlayer.addPeriodicTimeObserver(forInterval: everySecond, queue: .main) { (CMTime) -> Void in
            guard self.audioPlayer.currentItem?.status == .readyToPlay else { return }
            let time: Float64 = CMTimeGetSeconds(self.player.currentTime());
            self.playbackSlider!.value = Float ( time );
        }
    }
    
    func playButtonTapped(_ sender: UIButton) {
        NSLog("pressed!")
        print("here it plays")
        if player?.rate == 0 {
            
            player!.play()
            playButton!.setImage(UIImage(named: "pause.png"), for: UIControlState.normal)
            //playButton!.setTitle("Pause", for: UIControlState.normal)
        } else {
            player!.pause()
            playButton!.setImage(UIImage(named: "play.png"), for: UIControlState.normal)
            //playButton!.setTitle("Play", for: UIControlState.normal)
        }
        
        
    }
    
    func playbackSliderValueChanged(_ playbackSlider: UISlider) {
        
        let seconds : Int64 = Int64(playbackSlider.value)
        let targetTime:CMTime = CMTimeMake(seconds, 1)
        
        player!.seek(to: targetTime)
        
        if player!.rate == 0 {
            player?.play()
            playButton!.setImage(UIImage(named: "pause.png"), for: UIControlState.normal)
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
