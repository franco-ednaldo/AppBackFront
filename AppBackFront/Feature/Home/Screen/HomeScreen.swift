//
//  HomeScreen.swift
//  AppBackFront
//
//  Created by Ednaldo Franco on 21/07/23.
//

import UIKit

class HomeScreen: UIView {
    
    lazy var viewBackGround:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 1/255, alpha: 1.0)
        return view
    }()
    
    lazy var logoImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "vector")
        return imageView
    }()
    
    lazy var searchBar: UISearchBar = {
        let search = UISearchBar()
        search.translatesAutoresizingMaskIntoConstraints = false
        search.clipsToBounds = true
        search.layer.cornerRadius = 20
        search.placeholder = "Pesquise pelo nome:"
        
        return search
    }()

    lazy var collectionView:UICollectionView = {
        let collectionView = UICollectionView()
        collectionView.backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 1/255, alpha: 1.0)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        // TODO register
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        layout.scrollDirection = .horizontal
        collectionView.setCollectionViewLayout(layout, animated: false)
        
        return collectionView
    }()
    
    lazy var tableView:UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        // TO DO: Register
        tableView.backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 1/255, alpha: 1.0)
        tableView.separatorStyle = .none
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addElements()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(viewBackGround)
        viewBackGround.addSubview(logoImageView)
        viewBackGround.addSubview(searchBar)
        viewBackGround.addSubview(collectionView)
        
        addSubview(tableView)
        
    }
    
    private  func addConstraints() {
        
    }
}
