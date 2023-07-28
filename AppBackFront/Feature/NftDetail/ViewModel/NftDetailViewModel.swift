//
//  NftDetail.swift
//  AppBackFront
//
//  Created by Ednaldo Franco on 27/07/23.
//

import UIKit

class NftDetailViewModel {
    private let nft:Nft
    
    init(nft: Nft) {
        self.nft = nft
    }
    
    var nftImage:String {
        return nft.nftImage ?? ""
    }
    
    func numberOfRowsInSection() -> Int{
        return 2
    }
    
    func heightForRowAt() -> CGFloat {
        return 400
    }
}
