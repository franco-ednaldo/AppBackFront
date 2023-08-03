//
//  WalletScreen.swift
//  AppBackFront
//
//  Created by Ednaldo Franco on 01/08/23.
//

import UIKit

class WalletScreen: UIView {
    
    lazy var tableView:UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 1/255, alpha: 1.0)
        tableView.separatorStyle = .none
        tableView.register(QuotationEthTableViewCell.self, forCellReuseIdentifier: QuotationEthTableViewCell.identifier)
        return tableView
        
    }()
    
    func configTableViewProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements(){
        addSubview(tableView)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
}
