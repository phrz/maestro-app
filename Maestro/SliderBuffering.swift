//
//  SliderBuffering.swift
//  Maestro
//
//  Created by Kena Du on 9/5/17.
//  Copyright © 2017 Maestro. All rights reserved.
//

import UIKit

class SliderBuffering:UISlider {
    let bufferProgress =  UIProgressView(progressViewStyle: .default)
    
    override init (frame : CGRect) {
        super.init(frame : frame)
    }
    
    convenience init () {
        self.init(frame:CGRect.zero)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        self.minimumTrackTintColor = UIColor.clear
        self.maximumTrackTintColor = UIColor.clear
        bufferProgress.backgroundColor = UIColor.clear
        bufferProgress.isUserInteractionEnabled = false
        bufferProgress.progress = 0.0
        bufferProgress.progressTintColor = UIColor.lightGray.withAlphaComponent(0.5)
        bufferProgress.trackTintColor = UIColor.black.withAlphaComponent(0.5)
        self.addSubview(bufferProgress)
    }
}
