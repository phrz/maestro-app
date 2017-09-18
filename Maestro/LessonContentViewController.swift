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
	
	override func setLessonContent(_ lc: LessonCard) {
		guard let lcon = lc as? LessonContent else {
			print("Bad cast")
			return
		}
		DispatchQueue.main.async {
			self.lessonContentView.lessonDetail.text = lcon.text
		}
		super.setLessonContent(lc)
	}
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	override func didTouchNextButton(sender: UIButton) {
		guard let vc = LessonRouter.shared.nextCard(after: self) else { return }
		self.navigationController?.pushViewController(vc, animated: true)
	}

}
