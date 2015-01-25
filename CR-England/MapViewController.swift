//
//  MapViewController.swift
//  CR-England
//
//  Created by Faisal on 1/2/15.
//  Copyright (c) 2015 Smash Analytics. All rights reserved.
//

import Foundation
import UIKit

class MapViewController: UIViewController {
    
    let cellIdentifier = "cellIdentifier"
    var tableData = [String]()
    var recognitions: NSArray? = NSArray()
    //@IBOutlet weak var tableViewMenu: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var bgImage = UIImage(named: "bg.png")
        var backgroundImageView = UIImageView(image: bgImage)
        backgroundImageView.frame = self.view.bounds
        self.view.addSubview(backgroundImageView)
        
        backgroundImageView.superview?.sendSubviewToBack(backgroundImageView)
    }
    
    override func viewDidAppear(animated: Bool) {
        // borders around safety info
    }
    
    override func viewWillAppear(animated: Bool) {
        //self.tableViewMenu.tableFooterView = UIView(frame: CGRectZero)
        self.title = "Threat Information Map"
        self.navigationController?.navigationBar.barTintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.redColor()]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadSettings() {
        //viewController.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        //[self.navigationController pushViewController:viewController animated:NO]
        //[UIView transitionWithView:self.navigationController.view duration:0.75 options:UIViewAnimationOptionTransitionFlipFromRight animations:nil completion:nil]
    }
    
}
