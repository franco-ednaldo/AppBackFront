//
//  HomeVC.swift
//  AppBackFront
//
//  Created by Ednaldo Franco on 21/07/23.
//

import UIKit

class HomeVC: UIViewController {
    private var screen:HomeScreen?
    private var viewModel:HomeViewModel = HomeViewModel()
    
    override func loadView() {
        screen = HomeScreen()
        view = screen
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate(delegate: self)
        viewModel.fetchRequest(.mock)
        screen?.configSearchBarDelegate(delegate: self)
        
    }
}

extension HomeVC:UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.filterSearchText(searchText)
        screen?.tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView
            .dequeueReusableCell(withReuseIdentifier: NftFilterCell.identifier, for: indexPath) as? NftFilterCell

        cell?.setupCell(filter: viewModel.getFilterNft(indexPath: indexPath))
        
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return viewModel.sizeForItemAt()
    }
    
}


extension HomeVC:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSectionTableView()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NftTableViewCell.identifier, for: indexPath) as? NftTableViewCell
        
        cell?.setupCell(data: viewModel.getNft(indexPath: indexPath))
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRowAt()
    }
    
    
}

extension HomeVC:HomeViewModelDelegate {
    func success() {
        DispatchQueue.main.async {
            self.screen?.configTableViewProtocol(delegate: self, dataSource: self)
            self.screen?.configCollectionViewProtocol(delegate: self, dataSource: self)
            self.screen?.tableView.reloadData()
        }
    }
    
    func failure() {
        
    }
    
    
}


