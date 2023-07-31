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
    
    var idNft:Int {
        return nft.nftID ?? 0
    }
    
    var nftTitle:String {
        return nft.nftNameImage ?? ""
    }
    
    var nftDescription:String {
        return nft.nftDescription ?? ""
    }
    
    var nftImage:String {
        return nft.nftImage ?? ""
    }
    
    func getNft()->Nft{
        return self.nft
    }
    
    func numberOfRowsInSection() -> Int{
        return 3
    }
    
    func heightForRowAt(indexPath: IndexPath, width: CGFloat) -> CGFloat {
        switch NameCellNftDetail(rawValue: indexPath.row) {
            
        case .nftImage:
            return 400
        case .description:
            return (nftDescription.height(withConstrainedWidth: width - 40, font: UIFont.systemFont(ofSize: 18))) + 89
        case .LastestDeal:
            return 400
        default:
            return 0
        }

    }
    

}
