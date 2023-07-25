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
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 1/255, alpha: 1.0)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(NftFilterCell.self, forCellWithReuseIdentifier: NftFilterCell.identifier)
        
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
    
    func configTableViewProtocol(delegate:UITableViewDelegate, dataSource:UITableViewDataSource) {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
    
    func configCollectionViewProtocol(delegate: UICollectionViewDelegate, dataSource: UICollectionViewDataSource) {
        collectionView.delegate = delegate
        collectionView.dataSource = dataSource
    }
    
    func configSearchBarDelegate(delegate: UISearchBarDelegate) {
        searchBar.delegate = delegate
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 1/255, alpha: 1.0)
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
        NSLayoutConstraint.activate([
            viewBackGround.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            viewBackGround.leadingAnchor.constraint(equalTo: leadingAnchor),
            viewBackGround.trailingAnchor.constraint(equalTo: trailingAnchor),
            viewBackGround.heightAnchor.constraint(equalToConstant: 160),
            
            logoImageView.topAnchor.constraint(equalTo: viewBackGround.topAnchor, constant: 5),
            logoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            logoImageView.heightAnchor.constraint(equalToConstant: 40),
            logoImageView.widthAnchor.constraint(equalToConstant: 40),
            
            searchBar.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 10),
            searchBar.leadingAnchor.constraint(equalTo: logoImageView.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            searchBar.heightAnchor.constraint(equalToConstant: 46),
            
            collectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 15),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: viewBackGround.bottomAnchor),
            
            tableView.topAnchor.constraint(equalTo: viewBackGround.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
