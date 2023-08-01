//
//  LatestDealViewModel.swift
//  AppBackFront
//
//  Created by Ednaldo Franco on 31/07/23.
//

import UIKit

enum HeightLastestDeal:CGFloat {
    case height = 70
}

class LatestDealViewModel {
    var nft: Nft?
    
    func setNft(nft: Nft) {
        self.nft = nft
    }
    
    var title:String {
        return nft?.titleLatestDeals ?? ""
    }
    
    func numberOfRowsInSection() -> Int{
        return nft?.latestDeals?.count ?? 0
    }
    
    func heightForRowAt() -> CGFloat {
        return HeightLastestDeal.height.rawValue
    }
    
    func loadLatestDeal(indexPath: IndexPath) -> LatestDeal {
        return self.nft?.latestDeals?[indexPath.row] ?? LatestDeal()
    }
    
    func isInicial(indexPath:IndexPath) -> Bool {
        return indexPath.row == 0
    }
    
    
    func isFinal(indexPath:IndexPath) -> Bool {
        return indexPath.row == numberOfRowsInSection() - 1
    }
}
