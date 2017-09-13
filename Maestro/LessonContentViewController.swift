//
//  LessonContentViewController.swift
//  Maestro
//
//  Created by Kena Du on 9/3/17.
//  Copyright © 2017 Maestro. All rights reserved.
//

import UIKit
import AVFoundation

class LessonContentViewController: UIViewController {
    
    var lessonContentView: LessonContentView {
        return view as! LessonContentView
    }
    
    override func loadView() {
        view = LessonContentView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
		
		lessonContentView.nextButton.addTarget(
			self,
			action: #selector(didTouchNextButton(sender:)),
			for: .touchUpInside
		)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	func didTouchNextButton(sender: UIButton) {
		let vc = LessonQuizViewController()
		self.navigationController?.pushViewController(vc, animated: true)
	}
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
