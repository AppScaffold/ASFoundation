//
//  UIViewController+Extension.swift
//  ASFoundation
//
//  Created by jesse on 2019/8/5.
//  Copyright © 2019 jesse. All rights reserved.
//

import UIKit

@objc public protocol AvoidKeyboardOverlayProtocol {
    func as_scrollViewForKeyboard() -> UIScrollView?
    func as_setupKeyboardObserver()
    
    func as_keyboardWillShow(notification: NSNotification)
    func as_keyboardWillHide(notification: NSNotification)
}

extension UIViewController: AvoidKeyboardOverlayProtocol {
    open func as_scrollViewForKeyboard() -> UIScrollView? {
        return nil
    }
    
    public func as_setupKeyboardObserver() {
        // Observe keyboard change
        NotificationCenter.default.addObserver(self, selector: #selector(as_keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(as_keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    public func as_keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo, let baseScrollView = as_scrollViewForKeyboard() else { return }
        var keyboardFrame: CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = view.convert(keyboardFrame, from: nil)
        
        var contentInset: UIEdgeInsets = baseScrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height
        baseScrollView.contentInset = contentInset
    }
    
    public func as_keyboardWillHide(notification: NSNotification) {
        guard let baseScrollView = as_scrollViewForKeyboard() else { return }
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        baseScrollView.contentInset = contentInset
    }
}
