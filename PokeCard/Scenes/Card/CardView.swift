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
		$0.font = UIFont.systemFont(ofSize: 30, weight: .bold)
		$0.textColor = UIColor(red: 25/255, green: 115/255, blue: 232/255, alpha: 0.91)
		return $0
	}(UILabel())
	
	lazy var cardImageView: UIImageView = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.layer.shadowColor = UIColor.black.cgColor
		$0.layer.shadowOpacity = 1
		$0.layer.shadowOffset = .zero
		$0.layer.shadowRadius = 10
		return $0
	}(UIImageView())
	
	lazy var moreInfoButton: UIButton = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.setTitle("More Info", for: .normal)
		$0.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
		$0.setTitleColor(.white, for: .normal)
		$0.clipsToBounds = true
		$0.layer.cornerRadius = 12
		$0.layer.borderColor = UIColor(red: 81/255, green: 84/255, blue: 157/255, alpha: 0.62).cgColor
		$0.layer.backgroundColor = UIColor(red: 25/255, green: 115/255, blue: 232/255, alpha: 0.91).cgColor
		$0.layer.borderWidth = 2
		$0.addTarget(self, action: #selector(tappedMoreInfo), for: .touchUpInside)
		return $0
	}(UIButton(type: .system))
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = UIColor(red: 255/255, green: 203/255, blue: 2/255, alpha: 1)
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
