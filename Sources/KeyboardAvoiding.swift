//
//  KeyboardAvoiding.swift
//  KeyboardAvoiding
//
//  Created by Tibor Bödecs on 2019. 02. 11..
//  Copyright © 2019. Tibor Bödecs. All rights reserved.
//

import UIKit

open class KeyboardAvoiding {

    open var showAnimationBlock: ((CGRect) -> Void)?
    open var hideAnimationBlock: (() -> Void)?

    open func start() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.onKeyboardShow(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.onKeyboardHide(_:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    open func stop() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func onKeyboardShow(_ notification: Notification) {
        guard
            let userInfo = notification.userInfo,
            let keyboardFrameFinal = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect,
            let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double,
            let curveInt = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? Int
        else {
            return
        }
        
        let animationCurve = UIView.AnimationCurve(rawValue: curveInt) ?? .linear
        let animationOptions = UIView.AnimationOptions(rawValue: UInt(animationCurve.rawValue << 16))
        
        UIView.animate(withDuration: duration, delay: 0, options: animationOptions, animations: {
            self.showAnimationBlock?(keyboardFrameFinal)
        }, completion: nil)
    }
    
    @objc func onKeyboardHide(_ notification: Notification) {
        guard
            let userInfo = notification.userInfo,
            let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double,
            let curveInt = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? Int
        else {
            return
        }
        
        let animationCurve = UIView.AnimationCurve(rawValue: curveInt) ?? .linear
        let animationOptions = UIView.AnimationOptions(rawValue: UInt(animationCurve.rawValue << 16))
        
        UIView.animate(withDuration: duration, delay: 0, options: animationOptions, animations: {
            self.hideAnimationBlock?()
        }, completion: nil)
    }
}
