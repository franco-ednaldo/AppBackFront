//
//  TableViewCell.swift
//  AppBackFront
//
//  Created by Ednaldo Franco on 25/07/23.
//

import UIKit
import AlamofireImage

class NftTableViewCell: UITableViewCell {
    static let identifier:String = String(describing: NftTableViewCell.self)
    
    private lazy var screen:NftTableViewScreen = {
        let screen = NftTableViewScreen()
        screen.translatesAutoresizingMaskIntoConstraints = false
        return screen
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addElements()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(data: Nft) {
        if let urlNFT: URL = URL(string: data.nftImage ?? ""), let urlUser: URL = URL(string: data.userImage ?? "") {
            
            screen.nftImageView.af.setImage(withURL: urlNFT, placeholderImage: UIImage(named: "threeButtons"))
            screen.nftImageView.backgroundColor = .white
            
            screen.userImageView.af.setImage(withURL: urlUser, placeholderImage: UIImage(systemName: "person.circle.fill"))
            screen.userImageView.backgroundColor = .white
            
            screen.priceLabel.text = data.price
            screen.priceValueLabel.text = "\(data.nftPrice ?? 0.0)"
            screen.ownerByPriceLabel.text = data.ownedBy
        
            screen.userLabel.text = data.userName
            
            
        }
    }
    
    private func addElements(){
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
