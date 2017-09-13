//
//  QuizContentView.swift
//  Maestro
//
//  Created by Kena Du on 9/7/17.
//  Copyright © 2017 Maestro. All rights reserved.
//

import UIKit
import UIImageViewAlignedSwift

class LessonQuizView: UIView {
	
	var quizCard: UIView
	var quizImage: UIImageView
	var quizQuestion: UILabel
	
	var quizChoices: UIView
	
	//choiceArray is under quizChoices
	var choiceArray: Array<UIButton>
	var quizIcon: UIImageViewAligned
	var nextButton: UIButton
	
	
	override init(frame: CGRect) {
		quizCard = {
			let em = UIFont.systemFontSize
			let l = UIView()
			l.layoutMargins = UIEdgeInsets(top: 3*em, left: 1*em, bottom: 1*em, right: 1*em)
			l.backgroundColor = UIColor(white: 0.95, alpha: 1) // #F3F3F3
			return l
		}()
		
		quizImage = {
			//let screenSize: CGRect = UIScreen.main.bounds
			let vImg = UIImageView()
			//vImg.frame = CGRect(x: 0, y: 0, width: 5, height: screenSize.height * 0.01)
			let i = UIImage(named:"The-Staff.jpg")
			vImg.image = i
			vImg.translatesAutoresizingMaskIntoConstraints = false
			return vImg
		}()
		
		quizQuestion = {
			let t = UILabel()
			let em = UIFont.systemFontSize
			t.numberOfLines = 0 // Auto
			t.lineBreakMode = .byWordWrapping
			t.font = UIFont.systemFont(ofSize: 2.5*em)
			t.text = "what is staff?"
			return t
		}()
		choiceArray = {
			let multiChoices = ["people employed by an organization.","five lines","five horizontal lines and four spaces each represents a pitch","none of the above"]
			var answerArray = [UIButton]()
			for choice in multiChoices{
				let answerChoice = UIButton()
				print(choice)
				answerChoice.setTitle(choice, for: .normal)
				answerArray.append(answerChoice)
			}
			return answerArray
		}()
		quizChoices = {
			let c = UIView()
			
			/*for choice in multiChoices{
			let answerChoice = UIButton()
			answerChoice.setTitle(choice, for: .normal)
			c.addSubview(answerChoice)
			//answerArray.append(answerChoice)
			}*/
			return c
		}()
		
		quizIcon = {
			let i = UIImage(imageLiteralResourceName: "quarter-note")
			let iv = UIImageViewAligned(image: i)
			iv.contentMode = .scaleAspectFit
			iv.alignment = .topLeft
			return iv
		}()
		
		nextButton = {
			let b = UnderlineButton()
			b.setTitle("next", for: .normal)
			return b
		}()
		
		super.init(frame: frame)
		quizCard.addSubview(quizImage)
		quizCard.addSubview(quizQuestion)
		var i = 20
		for choice in choiceArray{
			quizChoices.draw(CGRect(x:i,y:160,width:300,height:290))
			i += 100
			print(i)
			quizChoices.addSubview(choice)
		}
		quizCard.addSubview(quizChoices)
		quizCard.addSubview(nextButton)
		
		addSubview(quizCard)
		
		updateConstraints()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func updateConstraints() {
		let em = UIFont.systemFontSize
		//		let statusBarHeight = UIApplication.shared.statusBarFrame.height
		
		quizCard.snp.makeConstraints { make in
			let margin = UIEdgeInsets(top: 0,
			                          left: 1*em,
			                          bottom: 1*em,
			                          right: 1*em)
			make.edges.equalToSuperview().inset(margin)
		}
		
		quizImage.snp.makeConstraints { make -> Void in
			make.edges.equalTo(quizCard).inset(UIEdgeInsetsMake(2, 20, 400, 20))
		}
		quizQuestion.snp.makeConstraints { make in
			make.top.equalTo(quizImage.snp.bottom).offset(0.5*em)
			make.left.equalTo(quizCard.snp.leftMargin)
			make.right.equalTo(quizCard.snp.rightMargin)
		}
		quizChoices.snp.makeConstraints { make in
			make.top.equalTo(quizQuestion.snp.bottom).offset(0.5*em)
			make.left.equalTo(quizCard.snp.leftMargin)
			make.right.equalTo(quizCard.snp.rightMargin)
			make.bottom.equalTo(quizCard.snp.bottomMargin)
		}
		var i : CGFloat = 0.5
		for choice in choiceArray{
			choice.snp.makeConstraints { make in
				make.top.equalTo(quizChoices.snp.top).offset(i*em)
				make.left.equalTo(quizCard.snp.leftMargin)
				i += 3
			}
		}
		
		
		/*quizIcon.snp.makeConstraints { make in
		make.top.equalTo(quizChoices.snp.bottom).offset(2*em)
		make.left.equalTo(quizCard.snp.leftMargin)
		make.height.equalTo(64)
		make.width.lessThanOrEqualToSuperview()
		}*/
		
		nextButton.snp.makeConstraints { make in
			make.rightMargin.equalToSuperview()
			make.bottomMargin.equalToSuperview()
		}
		
		super.updateConstraints()
	}
	
	
	
	override func layoutSubviews() {
		super.layoutSubviews()
	}
	
}
