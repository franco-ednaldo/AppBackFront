//
//  GenericService.swift
//  AppBackFront
//
//  Created by Ednaldo Franco on 24/07/23.
//

import Foundation
import Alamofire


enum TypeFetch {
    case mock
    case request
}

enum Error: Swift.Error {
    case fileNotFound(name:String)
    case fileDecodingFailed(name:String, Swift.Error)
    case errorRequest(AFError)
}
protocol GenericServices: AnyObject {
    typealias completion<T> = (_ result:T, _ failure:Error?) -> Void
}

