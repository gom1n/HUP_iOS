//
//  UIView+Extension.swift
//  HUP
//
//  Created by gomin on 2022/05/10.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {  //모따기
        get {
            layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
