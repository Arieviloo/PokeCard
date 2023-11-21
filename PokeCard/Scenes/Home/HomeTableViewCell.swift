//
//  HomeTableViewCell.swift
//  PokeCard
//
//  Created by Jadië Oliveira on 25/10/23.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
	
	static let identifier = "HomeTableViewCell"
	
	lazy var borderView: UIView = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.layer.cornerRadius = 8
		$0.layer.borderColor = UIColor.black.cgColor
		$0.layer.backgroundColor = UIColor.white.cgColor
		$0.layer.borderWidth = 2
		
		$0.layer.shadowOffset = CGSize(width: 3, height: 4)
		$0.layer.shadowRadius = 0
		$0.layer.shadowOpacity = 1
		return $0
	}(UIView())
	
	lazy var nameLabel: UILabel = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.font = UIFont.systemFont(ofSize: 20, weight: .light)
		return $0
	}(UILabel())
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		contentView.addSubview(borderView)
		borderView.addSubview(nameLabel)
		configConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func configConstraints() {
		NSLayoutConstraint.activate([
			borderView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
			borderView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
			borderView.heightAnchor.constraint(equalToConstant: 70),
			
			
			nameLabel.centerYAnchor.constraint(equalTo: borderView.centerYAnchor),
			nameLabel.leadingAnchor.constraint(equalTo: borderView.leadingAnchor, constant: 15),
			nameLabel.trailingAnchor.constraint(equalTo: borderView.trailingAnchor, constant: -15),
			
		])
	}
}
