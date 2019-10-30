//
//  NavigationBar.swift
//  News
//
//  Created by Vikhyath on 28/10/19.
//  Copyright © 2019 Vikhyath. All rights reserved.
//

import UIKit

protocol NavBarDelegate: class {
    func didSelectNavigationBarButton(type: NavbarButtonType)
    func didchangeNavbarHeight(height: CGFloat)
}

enum NavbarButtonType {
    case left
    case right
}

class NavigationBar: UIView {
    
    @IBOutlet weak internal var navBarTitle: UILabel!
    @IBOutlet weak private var navBarLeftButton: UIButton!
    @IBOutlet weak private var navBarTitleImageView: UIImageView!
    @IBOutlet weak internal var navBarRightButton: UIButton!
    @IBOutlet weak private var rightButtonWidthConstraint: NSLayoutConstraint!
    
    // For animation purpose
    @IBOutlet weak internal var titleLabelCenterYConstraint: NSLayoutConstraint!
    @IBOutlet weak internal var titleLabelBottomConstraint: NSLayoutConstraint!
    
    weak var delegate: NavBarDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = UIColor.red
    }
    
    func setWhiteNavbarBackgroundColor(requireShadow: Bool = true) {
        backgroundColor = UIColor.white
        
//        if requireShadow {
//            addShadowedImageView()
//        }
    }
    
    func setUpNavTitle(title: String, color: UIColor = UIColor.white, shouldShow: Bool = true) {
        navBarTitle.isHidden = !shouldShow
        navBarTitleImageView.isHidden = true
        navBarTitle.textColor = color
        navBarTitle.text = "News"
    }
    
    func setUpNavImage(image: UIImage, color: UIColor = UIColor.white) {
        navBarTitleImageView.isHidden = false
        navBarTitle.isHidden = true
        navBarTitleImageView.image = image.withRenderingMode(.alwaysTemplate)
        navBarTitleImageView.tintColor = color
    }
    
    func setUpNavBarButton(type: NavbarButtonType, title: String? = nil, image: UIImage? = nil, color: UIColor = UIColor.white) {
        switch type {
        case .left:
            navBarLeftButton.isHidden = false
            navBarLeftButton.setTitle(nil, for: .normal)
            navBarLeftButton.setImage(nil, for: .normal)
            
            if let title = title {
                navBarLeftButton.setTitleColor(color, for: .normal)
                navBarLeftButton.setTitle(title, for: .normal)
            }
            
            if let image = image {
                navBarLeftButton.setImage(image.withRenderingMode(.alwaysTemplate), for: .normal)
                navBarLeftButton.tintColor = color
            }
            
        case .right:
            navBarRightButton.isHidden = false
            navBarRightButton.setTitle(nil, for: .normal)
            navBarRightButton.setImage(nil, for: .normal)
            navBarRightButton.semanticContentAttribute = .forceRightToLeft
            
            var titleWidth: CGFloat = 0
            if let title = title {
                navBarRightButton.setTitleColor(color, for: .normal)
                navBarRightButton.setTitle(title, for: .normal)
                
                // If title extends, then expand the width of button to a certain extent
                titleWidth = ceil((title as NSString).size(withAttributes: [NSAttributedString.Key.font: (navBarRightButton.titleLabel?.font ?? UIFont.systemFont(ofSize: 14)), NSAttributedString.Key.kern: 0.8]).width)
                titleWidth = (titleWidth < 44) ? 44 : max(60, titleWidth)
            }
            
            if let image = image {
                navBarRightButton.setImage(image.withRenderingMode(.alwaysTemplate), for: .normal)
                navBarRightButton.tintColor = color
                
                // Add some padding to image view and title if present
                if title != nil {
                    titleWidth += 8
                    
                    // Add padding between title and image (8)
                    navBarRightButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 8)
                }
                
                // Add image view's width if present
                titleWidth += (navBarRightButton.imageView?.frame.size.width ?? 0)
            }
            
            if titleWidth > rightButtonWidthConstraint.constant {
                rightButtonWidthConstraint.constant = titleWidth
            }
        }
    }
    
    // Called when animating the transition of button
    func updateNavBarButton(type: NavbarButtonType, color: UIColor) {
        let navbarButton: UIButton
        
        if type == .left {
            navbarButton = navBarLeftButton
        } else {
            navbarButton = navBarRightButton
            navbarButton.semanticContentAttribute = .forceRightToLeft
            
            // If title and image is set, then set the insets forcefully. Else it'll be reset automatically when updating the title
            if navbarButton.title(for: .normal) != nil && navbarButton.image(for: .normal) != nil {
                // Add padding between title and image (8)
                navBarRightButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 8)
            }
        }
        
        // If title is set, then change the title color.
//        if navbarButton.title(for: .normal) != nil {
//            navbarButton.setAttributedTitle(color, for: .normal)
//        }
        
        navbarButton.tintColor = color
    }
    
    @IBAction private func didSelectLeftButton(_ sender: Any) {
        delegate?.didSelectNavigationBarButton(type: .left)
    }
    
    @IBAction private func didSelectRightButton(_ sender: Any) {
        delegate?.didSelectNavigationBarButton(type: .right)
    }
}
