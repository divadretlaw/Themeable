//
//  ViewController.swift
//  Themeable
//
//  Created by David Walter on 28.01.18.
//  Copyright © 2018 David Walter. All rights reserved.
//

import UIKit
import Themeable

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = Theme.shared.colors.background
    }

    @IBAction func switchTheme(_ sender: AnyObject?) {
        if Theme.shared.colors == ThemeColors.light {
            Theme.shared.colors = .dark
        } else {
            Theme.shared.colors = .light
        }
        
        Theme.shared.apply(force: true)
        self.view.backgroundColor = Theme.shared.colors.background
    }

}
