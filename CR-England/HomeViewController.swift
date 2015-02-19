//
//  HomeViewController.swift
//  CR-England
//
//  Created by Faisal on 12/31/14.
//  Copyright (c) 2014 Smash Analytics. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var scroll: UICollectionView!
    var riskNames: [NSString] = ["Fatigue", "Icy Roads", "Collision Wind", "Fog", "Theft", "Hill", "Backing", "Wildlife", "Curves", "Collision"]
    var riskAPM: [NSString] = ["AM", "AM", "PM", "AM", "AM", "PM", "AM", "PM", "AM", "AM"]

    var isFirstView = true
    var colorArrays = Array<Array<AnyObject>>()
    let cellIdentifier = "cellIdentifier"
    var tableData = [String]()
    var recognitions: NSArray? = NSArray()
    //@IBOutlet weak var tableViewMenu: UITableView!
    @IBOutlet weak var OuterSafetyView: UIView!
    @IBOutlet weak var safetyInfo1: UIView!
    @IBOutlet weak var safetyInfo0: UIView!
    @IBOutlet weak var safetyInfo2: UIView!
    @IBOutlet weak var familyMessage: UIView!

    let safetyRec0 = UITapGestureRecognizer()
    let safetyRec1 = UITapGestureRecognizer()
    let safetyRec2 = UITapGestureRecognizer()

    override func viewDidLoad() {
        super.viewDidLoad()
        addCamsIcon()
        var bgImage = UIImage(named: "bg.png")
        var backgroundImageView = UIImageView(image: bgImage)
        backgroundImageView.frame = self.view.bounds
        self.view.addSubview(backgroundImageView)
        loadSafetyEvents()
        var frame: CGRect = scroll.frame
        frame.size.width = self.view.bounds.width
        scroll.frame = frame
        scroll.collectionViewLayout.invalidateLayout()
        println(scroll.description)
        backgroundImageView.superview?.sendSubviewToBack(backgroundImageView)
    }

    func showSafetyDetails(){
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        var settingsViewController: AnyObject! = storyboard.instantiateViewControllerWithIdentifier("SafetyDetailsView")
        self.navigationController?.pushViewController(settingsViewController as UIViewController, animated: true)
    }
    
    @IBAction func loadSafety(sender: AnyObject) {
        self.showSafetyDetails()
    }
    
    
    func loadSafetyEvents(){
        loadColors()
    }

    override func viewDidAppear(animated: Bool) {
        // borders around safety info
        var topBorder = CALayer();
        topBorder.frame = CGRectMake(0.0, 0.0, OuterSafetyView.bounds.size.width, 1.0);
        topBorder.backgroundColor = UIColor(red: 105, green: 77, blue: 79, alpha: 0.2).CGColor//[UIColor redColor].CGColor;
        OuterSafetyView.layer.addSublayer(topBorder)
        familyMessage.layer.addSublayer(topBorder)
        
        OuterSafetyView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
    }
    
    func addCamsIcon(){
        let favImage = UIImage(named: "camp-top")
        let imageview = UIImageView(image: favImage)
        imageview.frame.size.width = 32
        imageview.frame.size.height = 18
        var singleTap = UITapGestureRecognizer(target: self, action: "loadCams")
        singleTap.numberOfTapsRequired = 1
        imageview.addGestureRecognizer(singleTap)
        imageview.userInteractionEnabled = true
        var button = UIBarButtonItem(customView: imageview)
        self.navigationItem.leftBarButtonItem = button

        let feedImage = UIImage(named: "feedback")
        let feedImageview = UIImageView(image: feedImage)
        feedImageview.frame.size.width = 32
        feedImageview.frame.size.height = 18
        var singleTap1 = UITapGestureRecognizer(target: self, action: "loadFeedBack")
        singleTap1.numberOfTapsRequired = 1
        feedImageview.addGestureRecognizer(singleTap1)
        feedImageview.userInteractionEnabled = true
        var button1 = UIBarButtonItem(customView: feedImageview)
        self.navigationItem.rightBarButtonItem = button1
    }
    
    func loadCams(){
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        var settingsViewController: AnyObject! = storyboard.instantiateViewControllerWithIdentifier("allCamsView")
        self.navigationController?.pushViewController(settingsViewController as UIViewController, animated: true)
    }
    
    func loadFeedBack(){
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        var settingsViewController: AnyObject! = storyboard.instantiateViewControllerWithIdentifier("threatEvalView")
        self.navigationController?.pushViewController(settingsViewController as UIViewController, animated: true)
    }
    
    override func viewWillAppear(animated: Bool) {
        //self.tableViewMenu.tableFooterView = UIView(frame: CGRectZero)
        //self.title = "CR England"
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
    
    func loadJSON(){
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = self.recognitions?.count
        return count!
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Configure the cell...
        var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("", forIndexPath: indexPath) as UITableViewCell
 
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func loadColors(){
        var angleGradientBorderView1Colors: [AnyObject] = []
        angleGradientBorderView1Colors = [
            UIColor.redColor().CGColor,
            UIColor.redColor().CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor.redColor().CGColor,
            UIColor.redColor().CGColor
        ]
        
        colorArrays.append(angleGradientBorderView1Colors)
        
        angleGradientBorderView1Colors = [
                
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor.redColor().CGColor,
            UIColor.redColor().CGColor,
            UIColor.redColor().CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor
                
        ]
        
        colorArrays.append(angleGradientBorderView1Colors)
            
        angleGradientBorderView1Colors = [
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor.redColor().CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor
        ]
        
        colorArrays.append(angleGradientBorderView1Colors)
        
        angleGradientBorderView1Colors = [
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor.redColor().CGColor,
            UIColor.redColor().CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor
        ]
        
        colorArrays.append(angleGradientBorderView1Colors)
        
        angleGradientBorderView1Colors = [
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor.redColor().CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor
        ]
        
        colorArrays.append(angleGradientBorderView1Colors)
        
        angleGradientBorderView1Colors = [
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor.redColor().CGColor,
            UIColor.redColor().CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor
        ]
        
        colorArrays.append(angleGradientBorderView1Colors)
        
        angleGradientBorderView1Colors = [
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor.redColor().CGColor,
            UIColor.redColor().CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor
        ]
        
        colorArrays.append(angleGradientBorderView1Colors)
        
        angleGradientBorderView1Colors = [
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor.redColor().CGColor,
            UIColor.redColor().CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor
        ]
        
        colorArrays.append(angleGradientBorderView1Colors)
        
        angleGradientBorderView1Colors = [
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor.redColor().CGColor,
            UIColor.redColor().CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor
        ]
        
        colorArrays.append(angleGradientBorderView1Colors)
        
        angleGradientBorderView1Colors = [
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor.redColor().CGColor,
            UIColor.redColor().CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor,
            UIColor(red: 255, green: 255, blue: 255, alpha: 0.2).CGColor
        ]
        
        colorArrays.append(angleGradientBorderView1Colors)
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return riskNames.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell: UICollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("riskCell", forIndexPath: indexPath) as UICollectionViewCell
        
        var baseView = AngleGradientBorderView(frame: CGRectMake(6, 5, 85, 85), borderColors: colorArrays[indexPath.row], borderWidth: 13)// UIView(frame: )
        
        baseView.backgroundColor = UIColor(white: 0.0, alpha: 0.0)
        baseView.tag = 4
        
        //var angleGradientBorderView2: AngleGradientBorderView = baseView
        
        var eCardImageView: UIImageView = cell.viewWithTag(2) as UIImageView
        
        var riskTitle: UILabel = cell.viewWithTag(3) as UILabel
        
        var timeTitle: UILabel = cell.viewWithTag(6) as UILabel
        
        timeTitle.text = riskAPM[indexPath.row]
        
        cell.viewWithTag(4)?.removeFromSuperview()

        cell.addSubview(baseView)
        
        eCardImageView.image = UIImage(named: "focus")

        riskTitle.text = riskNames[indexPath.row]
        
        return cell
    }
    

}
