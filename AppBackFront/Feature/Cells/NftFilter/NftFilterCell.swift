//
//  NftFilterCell.swift
//  AppBackFront
//
//  Created by Ednaldo Franco on 24/07/23.
//

import UIKit

class NftFilterCell: UICollectionViewCell {
    static let identifier:String = String(describing: NftFilterCell.self)
    
    private var filter:FilterNft?
    
    private lazy var screen:NftFilterCellScreen = {
        let view = NftFilterCellScreen()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    } ()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        addConstraints()
        screen.delegate(delegate: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(filter: FilterNft) {
        self.filter = filter
        screen.filterLabel.text = filter.title ?? ""
        setSelectedItem()
        
    }
    
    private func setSelectedItem() {
        if filter?.isSelected ?? false {
            screen.filterLabel.backgroundColor = .purple
        } else {
            screen.filterLabel.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1.0)
        }
    }
    
    private func addElements() {
        contentView.addSubview(screen)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            screen.topAnchor.constraint(equalTo: topAnchor),
            screen.leadingAnchor.constraint(equalTo: leadingAnchor),
            screen.trailingAnchor.constraint(equalTo: trailingAnchor),
            screen.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
}

extension NftFilterCell:NftFilterCellScreenDelegate {
    
    func tappedSelectionLabel() {
        self.filter?.isSelected = true
        self.setSelectedItem()
    }
    
    
}
