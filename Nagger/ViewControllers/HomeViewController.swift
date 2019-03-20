//
//  HomeViewController.swift
//  Nagger
//
//  Created by Bishal Wagle on 3/16/19.
//  Copyright © 2019 Bishal Wagle. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController{
    
    @IBOutlet var createNewTaskButton: UIButton!
    
    @IBAction func createNewTaskButtonPressed() {
        let createTaskViewController = CreateTaskViewController.instantiateFromStoryBoard()
        self.present(createTaskViewController, animated: true, completion: nil)
    }
}

