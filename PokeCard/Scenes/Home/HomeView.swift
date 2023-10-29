//
//  HomeView.swift
//  PokeCard
//
//  Created by Jadië Oliveira on 25/10/23.
//

import UIKit

class HomeView: UIView {
	
	lazy var listTableView: UITableView = {
		$0.translatesAutoresizingMaskIntoConstraints = false
		$0.separatorInset = .zero
		$0.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
		return $0
	}(UITableView())
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		addSubview(listTableView)
		configConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	public func protocolsTableView(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
		listTableView.delegate = delegate
		listTableView.dataSource = dataSource
	}
	
	private func configConstraints() {
		NSLayoutConstraint.activate([
			listTableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
			listTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
			listTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
			listTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
		])
	}
}
