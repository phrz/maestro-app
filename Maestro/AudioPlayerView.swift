//
//  AudioPlayerView.swift
//  Maestro
//
//  Created by Paul Herz on 9/13/17.
//  Copyright © 2017 Maestro. All rights reserved.
//

import UIKit
import AVFoundation

class AudioPlayerView: UIView {
	
	let playButton: UIButton
	let progressSlider: UISlider
	
	let audioPlayer: AVPlayer
	let audioContent: AVPlayerItem
	
	var isTouchingSlider: Bool = false
	
	var isPlaying: Bool {
		get {
			return audioPlayer.rate != 0 && audioPlayer.error == nil
		}
	}
	
	override var intrinsicContentSize: CGSize {
		return CGSize(width: UIViewNoIntrinsicMetric, height: 50)
	}
	
	override init(frame: CGRect) {
		playButton = {
			let p = UIButton()
			p.setImage(
				UIImage.init(named: "play-icon"),
				for: .normal
			)
			p.backgroundColor = .clear
			p.tintColor = .black
			return p
		}()
		
		progressSlider = {
			let s = UISlider()
			s.minimumValue = 0
			return s
		}()
		
		audioContent = AVPlayerItem(url:
			URL(string: "https://s3.amazonaws.com/kargopolov/kukushka.mp3")!
		)
		audioPlayer = AVPlayer(playerItem: audioContent)
		
		super.init(frame: frame)
		setupProgressSlider()
		
		playButton.addTarget(
			self,
			action: #selector(self.togglePlayState),
			for: .touchUpInside
		)
		
		addSubview(playButton)
		addSubview(progressSlider)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setupProgressSlider() {
		progressSlider.maximumValue = Float(audioContent.asset.duration.seconds)
		progressSlider.isContinuous = false
		progressSlider.tintColor = .darkGray
		progressSlider.addTarget(
			self,
			action: #selector(progressSliderValueChanged(_:)),
			for: .valueChanged
		)
		
		progressSlider.addTarget(self, action: #selector(didTouchDownSlider), for: .touchDown)
		progressSlider.addTarget(self, action: #selector(didTouchUpSlider), for: .touchUpInside)
		progressSlider.addTarget(self, action: #selector(didTouchUpSlider), for: .touchUpOutside)
		
		// Every second, advance the slider.
		let everySecond = CMTime(seconds: 1, preferredTimescale: 1)
		audioPlayer.addPeriodicTimeObserver(forInterval: everySecond, queue: .main) { _ in
			// Unless the song isn't playing, or the user is touching it
			guard self.isPlaying, !self.isTouchingSlider else {
				return
			}
			self.progressSlider.value = Float(self.audioPlayer.currentTime().seconds);
		}
	}
	
	func togglePlayState() {
		if isPlaying {
			audioPlayer.pause()
			playButton.setImage(UIImage(named: "play-icon"), for: UIControlState.normal)
		} else {
			audioPlayer.play()
			playButton.setImage(
				UIImage(named: "pause-icon"), for: UIControlState.normal
			)
		}
	}
	
	func didTouchDownSlider() {
		DispatchQueue.main.async { self.isTouchingSlider = true }
	}
	
	func didTouchUpSlider() {
		DispatchQueue.main.async { self.isTouchingSlider = false }
	}
	
	func progressSliderValueChanged(_ playbackSlider: UISlider) {
		let targetTime: CMTime = CMTime(
			seconds: Double(playbackSlider.value),
			preferredTimescale: 1
		)
		
		audioPlayer.seek(to: targetTime)
	}
	
	override func updateConstraints() {
		playButton.snp.makeConstraints { make in
			make.size.equalTo(30)
			make.left.equalToSuperview()
			make.centerY.equalToSuperview()
		}
		progressSlider.snp.makeConstraints { make in
			make.left.equalTo(playButton.snp.right).offset(10)
			make.right.equalToSuperview()
			make.centerY.equalToSuperview()
		}
		
		super.updateConstraints()
	}
}
