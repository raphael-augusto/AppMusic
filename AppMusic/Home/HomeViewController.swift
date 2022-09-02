//
//  ViewController.swift
//  AppMusic
//
//  Created by Raphael Augusto on 31/08/22.
//

import UIKit

class HomeViewController: UIViewController {

    var screen: HomeViewControllerScreen?
    
    override func loadView() {
        self.screen = HomeViewControllerScreen()
        self.view   = self.screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

