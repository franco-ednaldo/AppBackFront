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
    case transactionList = 1
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
    
    public var latestTransactionsCell: LatestTransactionsCell {
            return walletData?.latestTransactionsCell ?? LatestTransactionsCell()
    }
    
    public var quotationEthereum: QuotationEthereum {
        return walletData?.quotationEthereum ?? QuotationEthereum()
    }
    
    func loadCurrentQuotationEthereum(indexPath: IndexPath) -> QuotationEthereum {
        return walletData?.quotationEthereum ?? QuotationEthereum()
    }
    
    func numberOfRowsInSection() -> Int {
        return 2
    }
    
    func heightForRowAt(indexPath: IndexPath) -> CGFloat {
        switch WalletNameCell(rawValue: indexPath.row) {
        case .quotationEth:
            return 250
        case .transactionList:
            return HeightLatestTransactions.height.rawValue * CGFloat(walletData?.latestTransactionsCell?.listOfTransactions?.count ?? 0) + 75
        default:
            return 0
            
        }
    }
}
