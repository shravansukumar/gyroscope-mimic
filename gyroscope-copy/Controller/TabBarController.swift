//
//  TabBarController.swift
//  gyroscope-copy
//
//  Created by Shravan Sukumar on 27/01/18.
//  Copyright © 2018 shravan. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
       // self.selectedIndex = 0
        self.tabBarController?.tabBar.isHidden = true
    }

 }
