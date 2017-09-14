//
//  LessonContentViewController.swift
//  Maestro
//
//  Created by Kena Du on 9/3/17.
//  Copyright © 2017 Maestro. All rights reserved.
//

import UIKit

class LessonContentViewController: LessonCardViewController {
	
    var lessonContentView: LessonContentView {
        return view as! LessonContentView
    }
    
    override func loadView() {
        view = LessonContentView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	override func didTouchNextButton(sender: UIButton) {
		let vc = LessonRouter.shared.nextCard(after: self)
		self.navigationController?.pushViewController(vc, animated: true)
	}

}
