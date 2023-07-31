//
//  LatestDealViewModel.swift
//  AppBackFront
//
//  Created by Ednaldo Franco on 31/07/23.
//

import UIKit

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
        return 70
    }
}
