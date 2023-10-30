//
//  CardViewController.swift
//  PokeCard
//
//  Created by Jadië Oliveira on 25/10/23.
//

import UIKit

class CardViewController: UIViewController {
	
	private var cardView: CardView? = CardView()
	private var namePokemon: String = ""
	private var hpPokemon: String = ""
	private var numberPokedex: Int = 0
	private var textCard: String = ""
	private var typeCard: String = ""

	override func viewDidLoad() {
		view = cardView
		super.viewDidLoad()
		cardView?.delegate(delegate: self)
	}
	
	public func configView(with viewModel: Card) {
		guard let cardView else { return }
		cardView.configView(with: viewModel)
		namePokemon = viewModel.name ?? ""
		hpPokemon = viewModel.hp ?? ""
		numberPokedex = viewModel.nationalPokedexNumber ?? 0
		textCard = viewModel.text?[0] ?? ""
		typeCard = viewModel.supertype ?? ""
	}
}

extension CardViewController: CardViewProtocol {
	func tappedMoreInfo() {
		let msgAlert = typeCard == "Pokémon" ? "Esse pokémon tem \(hpPokemon) de HP e seu número na pokedex é \(numberPokedex)" : textCard
		let alertController = UIAlertController(title: namePokemon, message: msgAlert, preferredStyle: .alert)
		alertController.addAction(UIAlertAction(title: "OK", style: .default))
		present(alertController, animated: true)
	}
}
