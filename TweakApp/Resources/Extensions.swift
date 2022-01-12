//
//  Extensions.swift
//  TweakApp
//
//  Created by Miguel Ángel Fonseca Pérez on 09/01/22.
//

import Foundation
import UIKit

protocol ReusableView: AnyObject {
    /// Represents the reusesable identifier for a cell
    static var reuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
    /// Set the reuse identifier to be equal to the class name
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

protocol NibLoadableView: AnyObject {
    /// Represents the class name of a xib file
    static var nibName: String { get }
}

extension NibLoadableView where Self: UIView {
    /// Set the nib name to be equal to the class name
    static var nibName: String {
        return String(describing: self)
    }
}

extension NibLoadableView where Self: UIViewController {
    /// Set the nib name to be equal to the class name
    static var nibName: String {
        return String(describing: self)
    }
}
