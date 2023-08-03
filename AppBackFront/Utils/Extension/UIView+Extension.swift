//
//  UIView+Extension.swift
//  AppBackFront
//
//  Created by Ednaldo Franco on 31/07/23.
//

import Foundation
import UIKit

extension UIView {
    
    func roundCorners(cornerRadiuns: Double, typeCorners: CACornerMask){
        self.layer.cornerRadius = CGFloat(cornerRadiuns)
        self.clipsToBounds = true
        self.layer.maskedCorners = typeCorners
        
    }
    

    
}
