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
        let screen = HomeScreen()
        view = screen
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate(delegate: self)
        viewModel.fetchRequest(.request)
        
        screen?.configTableViewProtocol(delegate: self, dataSource: self)
        screen?.configCollectionViewProtocol(delegate: self, dataSource: self)
        screen?.configSearchBarDelegate(delegate: self)
        
    }
    
}

extension HomeVC:UISearchBarDelegate {
    
}

extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 150)
    }
    
}


extension HomeVC:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}

extension HomeVC:HomeViewModelDelegate {
    func success() {
        screen?.configTableViewProtocol(delegate: self, dataSource: self)
    }
    
    func failure() {
        
    }
    
    
}


