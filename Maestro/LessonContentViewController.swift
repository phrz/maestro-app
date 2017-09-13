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
    
    var audioPlayer: AVPlayer?
    var audioContent: AVPlayerItem?
    
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
        let duration: CMTime = audioContent!.asset.duration
        let seconds: Float64 = CMTimeGetSeconds(duration)
        
        let s = lessonContentView.audioPlayerSlider
        s.maximumValue = Float(seconds)
        s.isContinuous = false
        s.tintColor = .darkGray
        s.addTarget(self, action: #selector(playbackSliderValueChanged(_:)), for: .valueChanged)
        
        // Every second, advance the slider.
        let everySecond = CMTime(seconds: 1, preferredTimescale: 1)
		
		guard let player = audioPlayer else {
			print("audioPlayer was nil in setupPlaybackSlider!")
			return
		}
		
        player.addPeriodicTimeObserver(forInterval: everySecond, queue: .main) { (CMTime) -> Void in
            guard player.currentItem?.status == .readyToPlay else { return }
            let time: Float64 = CMTimeGetSeconds(player.currentTime());
            self.lessonContentView.audioPlayerSlider.value = Float(time);
        }
    }
    
    func playButtonTapped(_ sender: UIButton) {
        if audioPlayer?.rate == 0 {
            audioPlayer?.play()
            sender.setImage(
				UIImage(named: "pause-icon"), for: UIControlState.normal
			)
            //playButton!.setTitle("Pause", for: UIControlState.normal)
        } else {
            audioPlayer?.pause()
            sender.setImage(UIImage(named: "play-icon"), for: UIControlState.normal)
            //playButton!.setTitle("Play", for: UIControlState.normal)
        }
    }
    
    func playbackSliderValueChanged(_ playbackSlider: UISlider) {
		guard let player = audioPlayer else {
			print("player is nil")
			return
		}
        let targetTime: CMTime = CMTime(seconds: Double(playbackSlider.value), preferredTimescale: 1)
		
		player.seek(to: targetTime)
		
        if player.rate == 0 {
            player.play()
            lessonContentView.audioPlayerPlayButton.setImage(
				UIImage(named: "pause-icon"), for: UIControlState.normal
			)
        }
    }

    
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
