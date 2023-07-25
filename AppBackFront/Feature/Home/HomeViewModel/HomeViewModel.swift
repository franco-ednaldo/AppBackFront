//
//  HomeViewModel.swift
//  AppBackFront
//
//  Created by Ednaldo Franco on 24/07/23.
//

import UIKit

protocol HomeViewModelDelegate: AnyObject {
    func success()
    func failure()
}

class HomeViewModel {
    private let service: HomeService = HomeService()
    private var nftData: NFTData?
    
    private weak var delegate:HomeViewModelDelegate?
    
    func delegate(delegate: HomeViewModelDelegate?) {
        self.delegate = delegate
    }
    
    func fetchRequest(_ typeFetch: TypeFetch) {
        switch typeFetch {
            
        case .mock:
            service.getHomeFromJson { result, failure in
                if let result {
                    self.nftData = result
                    self.delegate?.success()
                } else {
                    self.delegate?.failure()
                }
            }
        case .request:
            service.getHome { result, failure in
                if let result {
                    self.nftData = result
                    self.delegate?.success()
                } else {
                    self.delegate?.failure()
                }
            }
        }
        
    }
    
    func getFilterNft(indexPath: IndexPath) -> FilterNft  {
        return self.nftData?.filterListNft?[indexPath.row] ?? FilterNft()
    }
    
    func numberOfRowsInSection() -> Int {
        return self.nftData?.filterListNft?.count ?? 0
    }
    
    func sizeForItemAt() -> CGSize {
        return CGSize(width: 100, height: 34)
    }
}
