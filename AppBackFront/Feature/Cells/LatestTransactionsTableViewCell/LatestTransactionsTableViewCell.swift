//
//  LatestTransactionsTableViewCell.swift
//  AppBackFront
//
//  Created by Ednaldo Franco on 03/08/23.
//

import UIKit

class LatestTransactionsTableViewCell: UITableViewCell {
    static let identifier:String = String(describing: LatestTransactionsTableViewCell.self)
    
    private let viewModel:LatestTransactionViewModel = LatestTransactionViewModel()
    
    private lazy var screen:LatestTransactionsTableViewCellScreen = {
        let screen = LatestTransactionsTableViewCellScreen()
        screen.translatesAutoresizingMaskIntoConstraints = false
        return screen
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addElements()
        addConstraints()
        
        screen.configTableViewProtocols(delegate: self, dataSource: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupCell(data: LatestTransactionsCell) {
        viewModel.setLatestTransactions(data: data )
        screen.titleLabel.text = viewModel.title
    }
    
    private func addElements() {
        contentView.addSubview(screen)
    }
    
    private func addConstraints(){
        NSLayoutConstraint.activate([
            screen.topAnchor.constraint(equalTo: topAnchor),
            screen.leadingAnchor.constraint(equalTo: leadingAnchor),
            screen.trailingAnchor.constraint(equalTo: trailingAnchor),
            screen.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}

extension LatestTransactionsTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListOfTransactionTableViewCell.identifier, for: indexPath) as? ListOfTransactionTableViewCell
        cell?.setupCell(data: viewModel.loadCurrentLatestDeal(indexPath: indexPath), isInicial: viewModel.isInicial(indexPath: indexPath), isFinal: viewModel.isFinal(indexPath: indexPath))
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRowAt
    }
    
}
