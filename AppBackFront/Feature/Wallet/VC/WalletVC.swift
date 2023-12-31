//
//  WalletVC.swift
//  AppBackFront
//
//  Created by Ednaldo Franco on 01/08/23.
//

import UIKit

class WalletVC: UIViewController {
    
    private let viewModel = WalletViewModel()
    
    private var screen:WalletScreen?
    
    override func loadView() {
        screen = WalletScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate(delegate: self)
        viewModel.fetchRequest(.request)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
}

extension WalletVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch WalletNameCell(rawValue: indexPath.row) {
               case .quotationEth:
                   let cell = tableView.dequeueReusableCell(withIdentifier: QuotationEthTableViewCell.identifier, for: indexPath) as? QuotationEthTableViewCell
                   cell?.setupCell(data: viewModel.quotationEthereum)
                   return cell ?? UITableViewCell()
               case .transactionList:
                   let cell = tableView.dequeueReusableCell(withIdentifier: LatestTransactionsTableViewCell.identifier, for: indexPath) as? LatestTransactionsTableViewCell
                   cell?.setupCell(data: viewModel.latestTransactionsCell)
                   return cell ?? UITableViewCell()
               default:
                   return UITableViewCell()
               }
              
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRowAt(indexPath: indexPath)
    }
}

extension WalletVC:WalletViewModelDelegate {
    func success() {
        DispatchQueue.main.async { [self] in
            screen?.configTableViewProtocols(delegate: self, dataSource: self)
            screen?.tableView.reloadData()
        }
    }
    
    func failure() {
        print(#function)
    }
    
    
}
