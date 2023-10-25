//
//  CardViewController.swift
//  PokeCard
//
//  Created by Jadië Oliveira on 25/10/23.
//

import UIKit

class CardViewController: UIViewController {
	
	private var cardView: CardView? = CardView()

	override func viewDidLoad() {
		view = cardView
		super.viewDidLoad()
	}
	
	public func configView(with viewModel: Card) {
		guard let cardView else { return }
		cardView.configView(with: viewModel)
	}
}
