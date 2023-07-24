//
//  HomeService.swift
//  AppBackFront
//
//  Created by Ednaldo Franco on 24/07/23.
//

import UIKit
import Alamofire

protocol HomeServiceDelegate: GenericServices {
    func getHomeFromJson(completion: @escaping completion<NFTData?>)
    
    func getHome(completion: @escaping completion<NFTData?>)
}

class HomeService: HomeServiceDelegate{
    func getHome(completion: @escaping completion<NFTData?>) {
        let url:String = "https://run.mocky.io/v3/26d4fe74-4405-4500-9aff-a376831b562c"
        AF.request(url, method: .get).validate(statusCode: 200...299).responseDecodable(of: NFTData.self) { response  in
            debugPrint(response)
            switch response.result {
            case .success(let success):
                print("SUCCESS -> \(#function)")
                completion(success, nil)
            case .failure(let error):
                print("FAILURE -> \(#function)")
                completion(nil, Error.errorRequest(error))
            }
        }
    }
    
    
    func getHomeFromJson(completion: @escaping completion<NFTData?>) {
        if let url = Bundle.main.url(forResource: "HomeData", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let nftData:NFTData = try JSONDecoder().decode(NFTData.self, from: data)
                completion(nftData, nil)
            } catch  {
                completion(nil, Error.fileDecodingFailed(name: "HomeData", error))
            }
        } else {
            completion(nil, Error.fileNotFound(name: "HomeData"))
        }
    }
    
    
}
