//
//  UIviewExtension.swift
//  Stretch Header
//
//  Created by Vikhyath on 25/01/19.
//  Copyright © 2019 Vikhyath. All rights reserved.
//

import UIKit

extension UIView {
    
    func anchor(top: NSLayoutYAxisAnchor?, bottom: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero,
                size: CGSize = .zero) {
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    func fillSuperView() {
        
        anchor(top: superview?.topAnchor, bottom: superview?.bottomAnchor, leading: superview?.leadingAnchor, trailing: superview?.trailingAnchor)
    }
    
//    func anchorSize(to view: UIView) {
//
//        widthAnchor.constraint(equalTo: view.widthAnchor)
//        heightAnchor.constraint(equalTo: view.heightAnchor)
//    }
    
    func anchorCenter(to view: UIView?) {
        
        guard let view = view else {
            return
        }
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func clampTop(to view: UIView) {
        
       
    }
    
    class func instanceFromNib() -> UIView? {
        return UINib(nibName: String(describing: self), bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? UIView
    }
    
    func dropShadow2(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 15, scale: Bool = true) {
        
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        layer.borderWidth = 0
    }
    
    var isShadowHidden: Bool {
        
        set(newValue) {
            layer.shadowOpacity = newValue ? 0 : 0.3
        }
        
        get {
            return layer.shadowOpacity == 0.0
        }
    }
}
