//
//  UIViewController + Extension.swift
//  AppBackFront
//
//  Created by Ednaldo Franco on 20/07/23.
//

import Foundation
import UIKit

extension UIViewController {
    func dismissKeyBoard() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
}

