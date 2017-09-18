//
//  MaestroNavigationController.swift
//  Maestro
//
//  Created by Paul Herz on 9/17/17.
//  Copyright © 2017 Maestro. All rights reserved.
//

import UIKit

class MaestroNavigationController: UINavigationController {

	var progressBar: UIProgressView!
	lazy var logo: UIImageView = {
		let l = UIImageView(image: UIImage(named: "maestro-m"))
		l.contentMode = .scaleAspectFit
		return l
	}()
	
    override func viewDidLoad() {
        super.viewDidLoad()

		progressBar = UIProgressView(progressViewStyle: .bar)
		
		let n = navigationBar
		n.barTintColor = .white
		n.isTranslucent = false
		n.setBackgroundImage(UIImage(), for: .default)
		n.shadowImage = UIImage()
		n.tintColor = .black
		n.addSubview(progressBar)
		n.addSubview(logo)
		
		progressBar.snp.makeConstraints { make in
			make.centerX.equalToSuperview()
			make.width.equalToSuperview()
			make.top.equalToSuperview()
		}
		
		logo.snp.makeConstraints { make in
			make.centerX.equalToSuperview()
			make.top.equalTo(n.snp.topMargin)
			make.bottom.equalTo(n.snp.bottomMargin)
//			make.height.lessThanOrEqualTo(20).priority(100)
		}
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
