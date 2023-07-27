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
    private var searchNftData: NFTData?
    
    func delegate(delegate: HomeViewModelDelegate?) {
        self.delegate = delegate
    }
    
    func fetchRequest(_ typeFetch: TypeFetch) {
        switch typeFetch {
            
        case .mock:
            service.getHomeFromJson { result, failure in
                if let result {
                    self.nftData = result
                    self.searchNftData = result
                    self.delegate?.success()
                } else {
                    self.delegate?.failure()
                }
            }
        case .request:
            service.getHome { result, failure in
                if let result {
                    self.nftData = result
                    self.searchNftData = result
                    self.delegate?.success()
                } else {
                    self.delegate?.failure()
                }
            }
        }
    }
    
    func getFilterNft(indexPath: IndexPath) -> FilterNft  {
        return self.searchNftData?.filterListNft?[indexPath.row] ?? FilterNft()
    }
    
    func getNft(indexPath: IndexPath) -> Nft  {
        return self.searchNftData?.nftList?[indexPath.row] ?? Nft()
    }
    
    func numberOfRowsInSection() -> Int {
        return self.searchNftData?.filterListNft?.count ?? 0
    }
    
    func numberOfRowsInSectionTableView() -> Int {
        return self.searchNftData?.nftList?.count ?? 0
    }
    
    func sizeForItemAt() -> CGSize {
        return CGSize(width: 100, height: 34)
    }
    
    func heightForRowAt() -> CGFloat {
        return 360
    }
    
    func filterSearchText(_ text:String) {
        if (text.isEmpty) {
            searchNftData?.nftList = nftData?.nftList
        } else {
            searchNftData?.nftList = nftData?.nftList?.filter({ nft in
                return nft.userName?.lowercased().contains(text.lowercased()) ?? false
            })
        }
    }
}
