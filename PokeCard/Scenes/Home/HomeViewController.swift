//
//  ViewController.swift
//  PokeCard
//
//  Created by Jadië Oliveira on 25/10/23.
//

import UIKit

class HomeViewController: UIViewController {
	
	private var homeView: HomeView?
	
	let listName = [ "joao1", "joa2", "joao3","joao4","joao5","joao6","joao7","joao8" ]
	
	override func loadView() {
		homeView = HomeView()
		view = homeView
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .red
		
		homeView?.protocolsTableView(delegate: self, dataSource: self)
	}
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		listName.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell else { return UITableViewCell()}
		cell.nameLabel.text = listName[indexPath.row].description
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		80
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
	
	
}

