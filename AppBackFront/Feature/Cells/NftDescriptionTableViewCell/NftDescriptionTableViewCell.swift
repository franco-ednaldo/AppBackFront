//
//  NftDescriptionTableViewCell.swift
//  AppBackFront
//
//  Created by Ednaldo Franco on 28/07/23.
//

import UIKit

class NftDescriptionTableViewCell: UITableViewCell {
    static let identifier:String = String(describing: NftDescriptionTableViewCell.self)
    
    private lazy var screen:NftDescriptionTableViewCellScreen = {
        let screen = NftDescriptionTableViewCellScreen()
        screen.translatesAutoresizingMaskIntoConstraints = false
        return screen
    }()
    
    static func nib() -> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addElements()
        addContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(id:Int, title:String, description:String ) {
        screen.idLabel.text = "\(id)"
        screen.titleLabel.text = title
        screen.descriptionLabel.text = description
    }
    
    private func addElements(){
        contentView.addSubview(screen)
    }
    
    private func addContraints(){
        NSLayoutConstraint.activate([
            screen.topAnchor.constraint(equalTo: topAnchor),
            screen.leadingAnchor.constraint(equalTo: leadingAnchor),
            screen.trailingAnchor.constraint(equalTo: trailingAnchor),
            screen.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
