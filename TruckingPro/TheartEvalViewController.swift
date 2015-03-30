//
//  TheartEvalViewController.swift
//  CR-England
//
//  Created by Faisal on 1/10/15.
//  Copyright (c) 2015 Smash Analytics. All rights reserved.
//

import Foundation
import UIKit

class TheartEvalViewController: UICollectionViewController {
    var cellColor = true
    
    var riskNames: [NSString] = ["Fatigue", "Icy Roads", "Collision Wind", "Fog", "Theft", "Hill", "Backing", "Wildlife", "Curves", "Collision"]
    
    var riskMedian: [NSString] = ["AM", "AM", "PM", "AM", "PM", "AM", "PM", "AM", "PM", "AM"]
    
    var riskDate: [NSString] = ["Fri 11/5", "Fri 11/5", "Sat 12/5", "Sat 12/5", "Sat 12/5", "Sun 13/5", "Mon 14/5", "Mon 14/5", "Mon 14/5", "Mon 14/5"]
    
    var riskPeak: [NSString] = ["Peak at 3AM", "Peak at 11AM", "Peak at 9AM", "Peak at 1PM", "Peak at 5PM", "Peak at 2AM", "Peak at 9AM", "Peak at 7PM", "Peak at 5AM", "Peak at 8AM"]
    
    var riskLast: [NSString] = ["Last 4 hours", "Last 6 hours", "Last 4 hours", "Last 1 hours", "Last 3 hours", "Last 4 hours", "Last 5 hours", "Last 2 hours", "Last 6 hours", "Last 3 hours"]

    var riskTime: [NSString] = ["3:00 AM", "11:00 AM", "9:00 AM", "1:00 PM", "5:00 PM", "2:00 AM", "9:00 AM", "7:00 PM", "5:00 AM", "8:00 AM"]
    
    
    var isFirstView = true
    var colorArrays = Array<Array<AnyObject>>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var bgImage = UIImage(named: "bg.png")
        var backgroundImageView = UIImageView(image: bgImage)
        backgroundImageView.frame = self.view.bounds
        self.view.addSubview(backgroundImageView)
        
        backgroundImageView.superview?.sendSubviewToBack(backgroundImageView)
        
        loadColors()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return riskNames.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        var cell: UICollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as UICollectionViewCell
        
        var median: UILabel = cell.viewWithTag(1) as UILabel
        var name: UILabel = cell.viewWithTag(2) as UILabel
        var date: UILabel = cell.viewWithTag(3) as UILabel
        var peakTime: UILabel = cell.viewWithTag(4) as UILabel
        var last: UILabel = cell.viewWithTag(5) as UILabel
        var timeClock: UILabel = cell.viewWithTag(6) as UILabel
        var eCardImageView: UIImageView = cell.viewWithTag(7) as UIImageView
        
        eCardImageView.image = UIImage(named: "focus")
        median.text = riskMedian[indexPath.row]
        name.text = riskNames[indexPath.row]
        date.text = riskDate[indexPath.row]
        peakTime.text = riskPeak[indexPath.row]
        last.text = riskLast[indexPath.row]
        timeClock.text = riskTime[indexPath.row]
        
        var baseView = AngleGradientBorderView(frame: CGRectMake(9, 28, 85, 85), borderColors: colorArrays[indexPath.row], borderWidth: 13)// UIView(frame: )
        
        baseView.backgroundColor = UIColor(white: 0.0, alpha: 0.0)
        baseView.tag = 8
        cell.viewWithTag(8)?.removeFromSuperview()
        cell.addSubview(baseView)

        return cell
    }
    
}