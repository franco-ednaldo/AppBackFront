//
//  TableViewCell.swift
//  AppBackFront
//
//  Created by Ednaldo Franco on 27/07/23.
//

import UIKit
import AlamofireImage

class NftImageTableViewCell: UITableViewCell {
    static let identifier:String = String(describing: NftImageTableViewCell.self)
    
    private lazy var screen:NtfImageTableViewCellScreen = {
        let screen = NtfImageTableViewCellScreen()
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
    
    func setupCell(urlImage:String) {
        guard let url = URL(string: urlImage) else { return }
        screen.nftImageView.af.setImage(withURL: url)
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
