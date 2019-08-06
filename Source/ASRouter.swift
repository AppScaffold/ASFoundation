//
//  ASRouter.swift
//  ASFoundation
//
//  Created by jesse on 2019/8/6.
//  Copyright © 2019 jesse. All rights reserved.
//

import Foundation

public protocol ASRoutable {
    func routeTo(_ next: UIViewController)
    func child() -> ASRoutable?
}

extension UITabBarController: ASRoutable {
    public func child() -> ASRoutable? {
        if let vc = selectedViewController as? ASRoutable {
            return vc
        }
        return nil
    }
    
    public func routeTo(_ next: UIViewController) {
        if let vc = child() {
            vc.routeTo(next)
        } else {
            self.viewControllers?.append(next)
        }
    }
}

extension UINavigationController: ASRoutable {
    public func child() -> ASRoutable? {
        return nil
    }
    
    public func routeTo(_ next: UIViewController) {
        pushViewController(next, animated: true)
    }
}

public class AppRouter {
    private let root: ASRoutable
    
    public init(root: ASRoutable) {
        self.root = root
    }
    
    public func routeTo(_ next: UIViewController) {
        root.routeTo(next)
    }
}
