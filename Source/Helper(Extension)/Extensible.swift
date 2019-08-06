//
//  Extensible.swift
//  Alamofire
//
//  Created by Jesse on 2019/3/3.
//

import UIKit

// some class which is able to extend its responsibility, such as ability of route
public protocol Extensible {
//    associatedtype ExtensibleType
//    var route: ExtensibleType { get }
}

public struct Auto<Base> {
    let base: Base
    init(_ base: Base) {
        self.base = base
    }
}

// MARK: Extensible func for UIViewController
public extension Extensible where Self: UIViewController {
    var route: Auto<Self> {
        get { return Auto(self) }
    }
}

// extension UIViewController: Extensible {}
