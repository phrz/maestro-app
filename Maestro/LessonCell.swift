//
//  LessonCell.swift
//  Maestro
//
//  Created by Paul Herz on 9/19/17.
//  Copyright © 2017 Maestro. All rights reserved.
//

import UIKit

class LessonCell: UITableViewCell {
	
	let cellCard: UIView
	let cellCardPrimaryLabel: UILabel
	let cellCardSecondaryLabel: UILabel

	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		cellCard = {
			let c = UIView()
			c.backgroundColor = .white
			c.layer.masksToBounds = false
			c.layer.shadowOffset = CGSize(width: 0, height: 2)
			c.layer.shadowRadius = 7
			c.layer.shadowOpacity = 0.5
			return c
		}()
		cellCardPrimaryLabel = {
			let l = UILabel()
			l.text = "cellCardPrimaryLabel"
			l.font = UIFont.systemFont(ofSize: UIFont.systemFontSize * 1.25)
			l.numberOfLines = 0
			l.lineBreakMode = .byWordWrapping
			return l
		}()
		cellCardSecondaryLabel = {
			let l = UILabel()
			l.text = "cellCardSecondaryLabel"
			l.font = UIFont.systemFont(ofSize: UIFont.systemFontSize)
			l.numberOfLines = 0
			l.lineBreakMode = .byWordWrapping
			l.textColor = UIColor(white: 0, alpha: 0.6)
			return l
		}()
		
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		backgroundColor = .clear
		selectionStyle = .none
		
		contentView.addSubview(cellCard)
		cellCard.addSubview(cellCardPrimaryLabel)
		cellCard.addSubview(cellCardSecondaryLabel)
		setNeedsUpdateConstraints()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	
    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
		if selected {
			cellCard.backgroundColor = UIColor(white: 0.9, alpha: 1)
		} else {
			cellCard.backgroundColor = .white
		}
    }
	
	override func updateConstraints() {
		let boxPadding = 10
		let textPadding = 15
		cellCard.snp.makeConstraints { make in
			make.edges.equalToSuperview().inset(boxPadding)
		}
		cellCardSecondaryLabel.snp.makeConstraints { make in
			make.left.equalToSuperview().inset(textPadding)
			make.right.equalToSuperview().inset(textPadding)
			make.top.equalToSuperview().inset(textPadding)
		}
		cellCardPrimaryLabel.snp.makeConstraints { make in
			make.top.equalTo(cellCardSecondaryLabel.snp.bottom).offset(5)
			make.left.equalToSuperview().inset(textPadding)
			make.bottom.equalToSuperview().inset(textPadding)
			make.right.equalToSuperview().inset(textPadding)
		}
		super.updateConstraints()
	}

}
