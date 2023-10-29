//
//  HomeTableViewCell.swift
//  PokeCard
//
//  Created by Jadië Oliveira on 25/10/23.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
	
	static let identifier = "HomeTableViewCell"
	
	lazy var nameLabel: UILabel = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.font = UIFont.systemFont(ofSize: 20)
		return $0
	}(UILabel())
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		contentView.addSubview(nameLabel)
		configConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func configConstraints() {
		NSLayoutConstraint.activate([
			nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
			nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
			nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
			
		])
	}
}
