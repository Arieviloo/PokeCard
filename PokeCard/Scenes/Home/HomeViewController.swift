//
//  ViewController.swift
//  PokeCard
//
//  Created by Jadië Oliveira on 25/10/23.
//

import UIKit

class HomeViewController: UIViewController {
	
	private var homeView: HomeView?
	private var listCard: [Card] = []
	
	override func loadView() {
		homeView = HomeView()
		view = homeView
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .red
		
		homeView?.protocolsTableView(delegate: self, dataSource: self)
		DataPokeCard.shared.getCard{ result in
			switch result {
			case .success( let sucess):
				self.listCard = sucess.cards ?? []
				self.homeView?.listTableView.reloadData()
			case .failure(let error):
				print(#function, " -> \(error)")
			}
		}
	}
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		listCard.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell else { return UITableViewCell()}
		cell.nameLabel.text =  listCard[indexPath.row].name
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		80
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
}

