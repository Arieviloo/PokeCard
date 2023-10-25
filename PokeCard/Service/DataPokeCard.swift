//
//  DataPokeCard.swift
//  PokeCard
//
//  Created by Jadië Oliveira on 25/10/23.
//

import UIKit

class DataPokeCard: NSObject {
	static let shared = DataPokeCard()
	
	func getCard(completion: @escaping(Result<Cards, Error>) -> Void) {
		guard let urlString = ProcessInfo.processInfo.environment["API_URL"] else { return }
		
		guard let url: URL = URL(string: urlString) else { return }
		
		let dataPoke = URLSession.shared.dataTask(with: url) { (data, response, error) in
			DispatchQueue.main.async {
				if let error {
					print("erro1 -> ", error)
				}
				
				guard let data else { return }
				
				guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }

				do {
					let cards: Cards = try JSONDecoder().decode(Cards.self, from: data)
					completion(.success(cards))
				} catch {
					print("err2 -> ", error)
				}
			}
			
		}
		dataPoke.resume()
		
	}
}
