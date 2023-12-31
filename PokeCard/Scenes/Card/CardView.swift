//
//  CardView.swift
//  PokeCard
//
//  Created by Jadië Oliveira on 25/10/23.
//

import UIKit

protocol CardViewProtocol:NSObject {
	func tappedMoreInfo()
}

class CardView: UIView {
	
	private weak var delegate: CardViewProtocol?
	
	public func delegate(delegate: CardViewProtocol) {
		self.delegate = delegate
	}
	
	lazy var titleLabel: UILabel = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.font = UIFont(name: "Bungee-Regular", size: 36)
		$0.numberOfLines = 0
		$0.textAlignment = .center
		$0.textColor = UIColor.appButtonPrimary
		return $0
	}(UILabel())
	
	lazy var cardImageView: UIImageView = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.layer.borderColor = UIColor.black.cgColor
		$0.layer.backgroundColor = UIColor.yellow.cgColor
		$0.layer.borderWidth = 2
		
		$0.layer.shadowOffset = CGSize(width: 3, height: 4)
		$0.layer.shadowRadius = 0
		$0.layer.shadowOpacity = 1
		return $0
	}(UIImageView())
	
	lazy var moreInfoButton: UIButton = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.setTitle("More Info", for: .normal)
		$0.titleLabel?.font = UIFont.systemFont(ofSize: 20)
		$0.setTitleColor(.black, for: .normal)
		$0.layer.cornerRadius = 8
		$0.layer.borderColor = UIColor.black.cgColor
		$0.layer.backgroundColor = UIColor.white.cgColor
		$0.layer.borderWidth = 2
		
		$0.layer.shadowOffset = CGSize(width: 3, height: 4)
		$0.layer.shadowRadius = 0
		$0.layer.shadowOpacity = 1
		$0.addTarget(self, action: #selector(tappedMoreInfo), for: .touchUpInside)
		return $0
	}(UIButton(type: .system))
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = UIColor.appBackgroundPrimary
		configSubView()
		configConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func configSubView() {
		addSubview(titleLabel)
		addSubview(cardImageView)
		addSubview(moreInfoButton)
	}
	
	@objc func tappedMoreInfo() {
		self.delegate?.tappedMoreInfo()
	}
	
	public func configView(with viewModel: Card) {
		titleLabel.text = viewModel.name
		
		guard let imageURL = viewModel.imageURLHiRes else { return }
		guard let URL = URL(string: imageURL) else { return }
		URLSession.shared.dataTask(with: URL) {[weak self] (data,_,_) in
			if let data {
				DispatchQueue.main.async {
					self?.cardImageView.image = UIImage(data: data)
				}
			}
		}.resume()
	}
	
	private func configConstraints() {
		NSLayoutConstraint.activate([
			titleLabel.bottomAnchor.constraint(equalTo: cardImageView.topAnchor, constant: -20),
			titleLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 12),
			titleLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -12),
			titleLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
			
			cardImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
			cardImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
			cardImageView.widthAnchor.constraint(equalToConstant: 300),
			cardImageView.heightAnchor.constraint(equalToConstant: 400),
			
			moreInfoButton.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 30),
			moreInfoButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
			moreInfoButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 100),
			moreInfoButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -100),
			moreInfoButton.heightAnchor.constraint(equalToConstant: 40),
		])
	}
}
