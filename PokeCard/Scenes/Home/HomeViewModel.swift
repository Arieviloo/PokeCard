//
//  HomeViewModel.swift
//  PokeCard
//
//  Created by Jadië Oliveira on 26/10/23.
//

import UIKit

protocol HomeViewModelProtocol: NSObject {
	func sucecc()
}

class HomeViewModel {
	
	private let service = DataPokeCard.shared
	private(set) var listCard: [Card] = []
	private var homeView: HomeView = HomeView()
	private weak var delegate: (HomeViewModelProtocol)?
	
	public func delegate(delegate: HomeViewModelProtocol) {
		self.delegate = delegate
	}
	
	init() {
		self.fetchRequestCard()
	}
	
	public func fetchRequestCard() {
		service.getCard{ [weak self] result in
			guard let self else { return }
			DispatchQueue.main.async{
				switch result {
				case .success( let sucess):
					self.listCard = sucess.cards ?? []
					self.delegate?.sucecc()
				case .failure(let error):
					print(#function, " -> \(error)")
				}
			}
		}
	}
	
	public func numberOfRowsInSection() -> Int {
		return listCard.count
	}
	
	public func heigthOfRow() -> CGFloat {
		return 80
	}
}
