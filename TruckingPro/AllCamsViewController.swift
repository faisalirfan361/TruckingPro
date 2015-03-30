//
//  File.swift
//  CR-England
//
//  Created by Faisal on 3/9/15.
//  Copyright (c) 2015 Smash Analytics. All rights reserved.
//

import Foundation
import UIKit
import AVKit
import Alamofire
import AVFoundation

class AllCamsViewController: BaseUIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var mainCollection: UICollectionView!
    var allCams : [Cam] = []
    
    @IBOutlet weak var popupViw: UIView!
    @IBOutlet weak var camLabel: UILabel!
    @IBOutlet weak var camImage: UIImageView!
    @IBOutlet weak var closePopup: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        super.setBG()
        loadJSON()
        self.allCams = SharedData.sharedInstance.allCams
        self.closePopup.addTarget(self, action: "closePopup:", forControlEvents: .TouchUpInside)
    }

    override func viewDidAppear(animated: Bool) {
        // borders around safety info
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

    func loadJSON(){
  
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return SharedData.sharedInstance.allCams.count
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell: UICollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("cellCams", forIndexPath: indexPath) as UICollectionViewCell
        var cCam : Cam = self.allCams[indexPath.row]
        var camLabel : UILabel = cell.viewWithTag(1) as UILabel
        var imageView : UIImageView = cell.viewWithTag(2) as UIImageView
        var imageView2 : UIImageView = UIImageView()
        imageView2.frame.size = imageView.frame.size
        imageView2.tag = 2
        imageView.removeFromSuperview()
        camLabel.text = cCam.name
        var urlStr: NSString = cCam.url!
        urlStr = urlStr.stringByReplacingOccurrencesOfString(" ", withString: "%20")
        var url = NSURL(string: urlStr)
        imageView2.sd_setImageWithURL(url)
        cell.addSubview(imageView2)
        return cell
    }

    func loadCamImage(index : Int){
        var urlStr: NSString = self.allCams[index].url!
        urlStr = urlStr.stringByReplacingOccurrencesOfString(" ", withString: "%20")
        var url = NSURL(string: urlStr)
        self.camImage.sd_setImageWithURL(url)
        self.loadCamDynamic(index)
    }
    
    func loadCamDynamic(index : Int){
        var urlStr: NSString = self.allCams[index].url!
        urlStr = urlStr.stringByReplacingOccurrencesOfString(" ", withString: "%20")
        var url = NSURL(string: urlStr)
        let data = NSData(contentsOfURL: url!)
        self.camImage.image =  UIImage(data: data!)
        if (!self.popupViw.hidden){
            let delayTime = dispatch_time(DISPATCH_TIME_NOW,
                Int64(1 * Double(NSEC_PER_SEC)))
            dispatch_after(delayTime, dispatch_get_main_queue()) {
                self.loadCamDynamic(index)
            }
        }
    }

    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.popupViw.hidden = false
        self.camLabel.text = self.allCams[indexPath.row].name
        self.loadCamImage(indexPath.row)
    }

    func closePopup(sender: UIButton!) {
        self.popupViw.hidden = true
    }
    
}