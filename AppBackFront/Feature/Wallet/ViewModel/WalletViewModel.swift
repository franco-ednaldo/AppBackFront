//
//  WalletViewModel.swift
//  AppBackFront
//
//  Created by Ednaldo Franco on 01/08/23.
//

import UIKit

protocol WalletViewModelDelegate: AnyObject {
    func success()
    func failure()
}

enum WalletNameCell: Int {
    case quotationEth = 0
}

class WalletViewModel {
    private var service: WalletService = WalletService()
    
    private var walletData: WalletData?
    
    private var delegate: WalletViewModelDelegate?
    
    func delegate(delegate: WalletViewModelDelegate?) {
        self.delegate = delegate
    }
    
    func fetchRequest(_ typeFetch: TypeFetch) {
        switch typeFetch {
            
        case .mock:
            service.getWalletFromJson { [self] result, failure in
                if let result {
                    walletData = result
                    delegate?.success()
                } else {
                    delegate?.failure()
                }
            }
        case .request:
            service.getWallet { [self] result, failure in
                if let result {
                    walletData = result
                    delegate?.success()
                } else {
                    delegate?.failure()
                }
            }
        }
        
    }
    
    func loadCurrentQuotationEthereum(indexPath: IndexPath) -> QuotationEthereum {
        return walletData?.quotationEthereum ?? QuotationEthereum()
    }
    
    func numberOfRowsInSection() -> Int {
        return 1
    }
    
    func heightForRowAt(indexPath: IndexPath) -> CGFloat {
        switch WalletNameCell(rawValue: indexPath.row) {
        case .quotationEth:
            return 250
        default:
            return 0
            
        }
    }
}
