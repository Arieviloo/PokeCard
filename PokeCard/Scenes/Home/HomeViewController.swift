//
//  ViewController.swift
//  PokeCard
//
//  Created by Jadië Oliveira on 25/10/23.
//

import UIKit

class HomeViewController: UIViewController {
	
	private var homeView: HomeView?
	private let cardVC = CardViewController()
	private let homeVM: HomeViewModel = HomeViewModel()
	
	override func loadView() {
		homeView = HomeView()
		view = homeView
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		homeVM.delegate(delegate: self)
		homeView?.protocolsTableView(delegate: self, dataSource: self)
		homeVM.configView(with: self)
	}
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		homeVM.numberOfRowsInSection()
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell else { return UITableViewCell()}
		cell.nameLabel.text =  homeVM.listCard[indexPath.row].name
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		homeVM.heigthOfRow()
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)

		cardVC.configView(with: homeVM.listCard[indexPath.row])
		navigationController?.pushViewController(cardVC, animated: true)
	}
}

extension HomeViewController: HomeViewModelProtocol {
	func sucecc() {
		homeView?.listTableView.reloadData()
	}
}

