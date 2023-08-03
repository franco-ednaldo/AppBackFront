//
//  WalletTableViewCell.swift
//  AppBackFront
//
//  Created by Ednaldo Franco on 01/08/23.
//

import UIKit

class QuotationEthTableViewCell: UITableViewCell {
    
    static let identifier:String = String(describing: QuotationEthTableViewCell.self)
    
    private lazy var screen:QuotationEthTableViewCellScreen = {
        let screen = QuotationEthTableViewCellScreen()
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
    
    func setupCell(data: QuotationEthereum) {
        screen.ethValueLabel.text = "\(data.ethValue ?? 0) ETH"
        screen.ethValueInDollarsLabel.text = "\(data.valueInDollars ?? 0)"
        screen.coinEthImageView.image = UIImage(named: data.coinEthImage ?? "")
    }
    
    private func addElements(){
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
