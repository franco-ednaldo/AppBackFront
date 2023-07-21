//
//  String+Extension.swift
//  AppBackFront
//
//  Created by Ednaldo Franco on 20/07/23.
//

import Foundation

enum ValidType {
    case email
    case password
}

extension String {
    enum Regex: String {
        case email = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$"
        case password = ".{6,}"
    }
    
    func isValid(validType: ValidType) -> Bool{
        let format = "SELF MATCHES %@"
        var regex = ""
        
        switch validType {
        case .email:
            regex = Regex.email.rawValue
        case .password:
            regex = Regex.password.rawValue
        }
        return NSPredicate(format: format, regex).evaluate(with: self)
    }
}
