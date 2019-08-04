//
//  Style.swift
//  demo
//
//  Created by Jesse on 2019/2/15.
//  Copyright © 2019 Jesse. All rights reserved.
//

import UIKit

/// A Style block struct
public struct Style<View: UIView> {
    
    public let style: (View) -> Void
    
    public init(_ style: @escaping (View) -> Void) {
        self.style = style
    }
    
    public func apply(to view: View) {
        style(view)
    }
}

extension UIView {
    /**
     Set Global Style.
     
     The following example shows how applying Global style to a
     `UILabel`:
     
         enum Stylesheet {
            static let title = Style<UILabel> {
                $0.font = .systemFont(ofSize: 13)
                $0.numberOfLines = 0
            }
         }
     
         // UILabel(style: Stylesheet.title)
     
     - Parameters:
        - style: A `Style` to apply
     */
    public convenience init<V>(style: Style<V>) {
        self.init(frame: .zero)
        apply(style)
    }
    
    public func apply<V>(_ style: Style<V>) {
        guard let view = self as? V else {
            print("💥 Could not apply style for \(V.self) to \(type(of: self))")
            return
        }
        style.apply(to: view)
    }
}
