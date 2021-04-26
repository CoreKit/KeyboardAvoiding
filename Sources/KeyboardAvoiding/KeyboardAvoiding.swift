//
//  KeyboardAvoiding.swift
//  KeyboardAvoiding
//
//  Created by Tibor Bödecs on 2019. 02. 11..
//  Copyright © 2019. Tibor Bödecs. All rights reserved.
//
#if(canImport(UIKit))
import UIKit

open class KeyboardAvoiding {
    
    open var willShow: ((CGRect) -> Void)?
    open var didShow: ((CGRect) -> Void)?
    open var willHide: (() -> Void)?
    open var didHide: (() -> Void)?
    
    public init(willShow: ((CGRect) -> Void)? = nil,
                didShow: ((CGRect) -> Void)? = nil,
                willHide: (() -> Void)? = nil,
                didHide: (() -> Void)? = nil) {
        
        self.willShow = willShow
        self.didShow = didShow
        self.willHide = willHide
        self.didHide = didHide
    }
    
    public func onKeyboardWillShow(_ willShow: @escaping ((CGRect) -> Void)) -> KeyboardAvoiding {
        self.willShow = willShow
        return self
    }
    
    public func onKeyboardDidShow(_ didShow: @escaping ((CGRect) -> Void)) -> KeyboardAvoiding {
        self.didShow = didShow
        return self
    }
    
    public func onKeyboardWillHide(_ willHide: @escaping (() -> Void)) -> KeyboardAvoiding {
        self.willHide = willHide
        return self
    }
    
    public func onKeyboardDidHide(_ didHide: @escaping (() -> Void)) -> KeyboardAvoiding {
        self.didHide = didHide
        return self
    }
    
    public func start() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillShow(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillHide(_:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardDidShow(_:)),
                                               name: UIResponder.keyboardDidShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardDidHide(_:)),
                                               name: UIResponder.keyboardDidHideNotification,
                                               object: nil)
    }
    
    public func stop() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    private func animate(curve: Int, duration: Double, _ block: @escaping (() -> Void)) {
        let animationCurve = UIView.AnimationCurve(rawValue: curve) ?? .linear
        let animationOptions = UIView.AnimationOptions(rawValue: UInt(animationCurve.rawValue << 16))
        
        UIView.animate(withDuration: duration, delay: 0, options: animationOptions, animations: block, completion: nil)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        guard
            let userInfo = notification.userInfo,
            let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double,
            let curve = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? Int,
            let frame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect
        else {
            return
        }
        
        self.animate(curve: curve, duration: duration) {
            self.willShow?(frame)
        }
    }
    
    @objc func keyboardDidShow(_ notification: Notification) {
        guard
            let userInfo = notification.userInfo,
            let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double,
            let curve = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? Int,
            let frame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect
        else {
            return
        }
        
        self.animate(curve: curve, duration: duration) {
            self.didShow?(frame)
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        guard
            let userInfo = notification.userInfo,
            let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double,
            let curve = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? Int
        else {
            return
        }
        self.animate(curve: curve, duration: duration) {
            self.willHide?()
        }
    }
    
    @objc func keyboardDidHide(_ notification: Notification) {
        guard
            let userInfo = notification.userInfo,
            let duration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double,
            let curve = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? Int
        else {
            return
        }

        self.animate(curve: curve, duration: duration) {
            self.didHide?()
        }
    }
}
#endif
