//
//  BaseVC.swift
//  News
//
//  Created by Vikhyath on 30/10/19.
//  Copyright © 2019 Vikhyath. All rights reserved.
//

import UIKit

public let cellPadding: CGFloat = 8.0
public let statusBarHeight = UIApplication.shared.statusBarFrame.size.height
public let navBarActualHeight = 44 + statusBarHeight

class BaseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    fileprivate var navBarHeightConstraint: NSLayoutConstraint?
    fileprivate var navigationBarInstance: NavigationBar?
    
    var navigationBarHeight: CGFloat {
        get {
            return navBarHeightConstraint?.constant ?? 0
        }
        
        set {
            navBarHeightConstraint?.constant = newValue
        }
    }
    
    var navBar: NavigationBar {
        if let navigationBarInstance = navigationBarInstance {
            return navigationBarInstance
        } else {
            guard let navigationBar = NavigationBar.instanceFromNib() as? NavigationBar else { return NavigationBar() }
            self.navigationBarInstance = navigationBar
            
            view.addSubview(navigationBar)
            
            navigationBar.translatesAutoresizingMaskIntoConstraints = false
            
            let leadingConstraint = NSLayoutConstraint(item: navigationBar, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 0.0)
            let trailingConstraint = NSLayoutConstraint(item: navigationBar, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: 0.0)
            let topConstraint = NSLayoutConstraint(item: navigationBar, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1.0, constant: 0.0)
            navBarHeightConstraint = NSLayoutConstraint(item: navigationBar, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: navBarActualHeight)
            
            view.addConstraints([leadingConstraint, trailingConstraint, topConstraint])
            if let heightConstraint = navBarHeightConstraint {
                navigationBar.addConstraint(heightConstraint)
            }
            
            return navigationBar
        }
    }

}
