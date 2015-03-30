//
//  SafetyDetailsViewController.swift
//  CR-England
//
//  Created by Faisal on 1/2/15.
//  Copyright (c) 2015 Smash Analytics. All rights reserved.
//

import Foundation
import UIKit

class SafetyDetailsViewController: BaseUITableViewController {
    
    let cellIdentifier = "cellIdentifier"
    var tableData = [String]()
    var recognitions: NSArray? = NSArray()
    //@IBOutlet weak var tableViewMenu: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //backgroundImageView.superview?.sendSubviewToBack(backgroundImageView)
    }
    
    override func viewDidAppear(animated: Bool) {
        // borders around safety info
    }
    
    override func viewWillAppear(animated: Bool) {
        //self.tableViewMenu.tableFooterView = UIView(frame: CGRectZero)
        self.title = ""
        self.navigationController?.navigationBar.barTintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.redColor()]
        
        super.setBG()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
