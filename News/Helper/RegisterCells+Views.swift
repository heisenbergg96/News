//
//  RegisterCells+Views.swift
//  News
//
//  Created by Vikhyath on 05/11/19.
//  Copyright © 2019 Vikhyath. All rights reserved.
//
import UIKit

protocol ReusableView {
    static var defaultReuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
    static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}

extension UICollectionReusableView: ReusableView {
}

extension UITableViewCell: ReusableView {
}

extension UITableViewHeaderFooterView: ReusableView {
}

protocol NibLoadableView: ReusableView {
    static var nibName: String { get }
}

extension NibLoadableView {
    static var nibName: String {
        return String(describing: self)
    }
}

extension UICollectionView {
    func register<T: UICollectionViewCell>(_: T.Type) {
        register(T.self, forCellWithReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func register<T: UICollectionViewCell>(_: T.Type) where T: NibLoadableView {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        
        register(nib, forCellWithReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func registerSupplementaryView<T: UICollectionReusableView>(_: T.Type, forKind kind: String) where T: NibLoadableView {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        
        register(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.defaultReuseIdentifier)")
        }
        
        return cell
    }
    
    func dequeueReusableSupplementaryView<T: UICollectionReusableView>(for indexPath: IndexPath, withKind kind: String) -> T {
        guard let reusableView = dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue supplementary view with identifier: \(T.defaultReuseIdentifier)")
        }
        
        return reusableView
    }
}
