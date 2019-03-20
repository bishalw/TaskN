//
//  InstantiableFromStoryboard.swift
//  Nagger
//
//  Created by Bishal Wagle on 3/16/19.
//  Copyright © 2019 Bishal Wagle. All rights reserved.
//

import UIKit

protocol InstantiableFromStoryboard: class {
    static var storyBoardName: String { get }
    static var storyBoardIdentifier: String { get }
    static func instantiateFromStoryBoard() -> Self
}

extension InstantiableFromStoryboard where Self: UIViewController {
    static func instantiateFromStoryBoard() -> Self {
        let storyBoard = UIStoryboard(name: Self.storyBoardName, bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: Self.storyBoardIdentifier)
        
        guard let selfViewController = viewController as? Self else {
            fatalError("Cannot find storybaord: \(Self.storyBoardName), identifier: \(Self.storyBoardIdentifier)")
        }
        return selfViewController
    }
}
