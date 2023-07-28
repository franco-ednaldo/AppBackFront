//
//  NftDetailVC.swift
//  AppBackFront
//
//  Created by Ednaldo Franco on 27/07/23.
//

import UIKit

class NftDetailVC: UIViewController {
    private let viewModel: NftDetailViewModel
    
    private var screen:NftDetailScreen?
    
    required init(nft: Nft) {
        viewModel = NftDetailViewModel(nft: nft)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        screen = NftDetailScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.configTableViewDelegate(delegate: self, dataSource: self)
    }
    
}

extension NftDetailVC:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NftImageTableViewCell.identifier, for: indexPath) as?  NftImageTableViewCell
    
        cell?.setupCell(urlImage: viewModel.nftImage)
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRowAt()
    }
    
}
