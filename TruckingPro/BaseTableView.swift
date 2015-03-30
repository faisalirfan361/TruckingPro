//
//  BaseTableView.swift
//  TruckingPro
//
//  Created by Faisal on 3/22/15.
//  Copyright (c) 2015 Smash Analytics. All rights reserved.
//

import Foundation

import UIKit

class BaseUITableViewController: UITableViewController {
    
    
    func setBG(){
        var bgImage = UIImage(named: "bg.png")
        var backgroundImageView = UIImageView(image: bgImage)
        backgroundImageView.frame = self.view.bounds
        self.view.addSubview(backgroundImageView)
        backgroundImageView.superview?.sendSubviewToBack(backgroundImageView)
    }
    
    
}
