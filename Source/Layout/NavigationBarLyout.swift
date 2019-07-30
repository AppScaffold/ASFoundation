//
//  NavigationBarLyout.swift
//
//  Created by Jesse on 2019/3/10.
//

import UIKit

extension UINavigationBar {
    public func setupTranslucent() {
        setBackgroundImage(UIImage(), for: .default)
        shadowImage = UIImage()
        isTranslucent = true
    }
}
