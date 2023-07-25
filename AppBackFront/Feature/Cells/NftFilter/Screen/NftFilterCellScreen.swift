//
//  NftFilterCellScreen.swift
//  AppBackFront
//
//  Created by Ednaldo Franco on 24/07/23.
//

import UIKit

protocol NftFilterCellScreenDelegate: AnyObject {
    func tappedSelectionLabel()
}

class NftFilterCellScreen: UIView {
    private weak var delegate: NftFilterCellScreenDelegate?
    
    func delegate(delegate: NftFilterCellScreenDelegate?) {
        self.delegate = delegate
    }
    
    lazy var filterLabel:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.backgroundColor = UIColor(red: 50/255, green: 50/255, blue: 50/255, alpha: 1.0)
        label.clipsToBounds = true
        label.layer.cornerRadius = 18
        label.textAlignment = .center
        let tap = UITapGestureRecognizer(target: self, action: #selector(tappedSelectionLabel))
        tap.numberOfTapsRequired = 1
        label.addGestureRecognizer(tap)
        label.isUserInteractionEnabled = true
        return label
    }()
    
    @objc func tappedSelectionLabel(_ sender: UITapGestureRecognizer){
        print(#function)
        delegate?.tappedSelectionLabel()
    }
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(filterLabel)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            filterLabel.topAnchor.constraint(equalTo: topAnchor),
            filterLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            filterLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            filterLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
}
