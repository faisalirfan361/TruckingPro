//
//  ViewCamsViewController.swift
//  CR-England
//
//  Created by Faisal on 1/10/15.
//  Copyright (c) 2015 Smash Analytics. All rights reserved.
//
import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class CamsViewController: BaseUIViewController {
    
    let cellIdentifier = "cellIdentifier"
    var tableData = [String]()
    var imagesURLs: [String] = []
    var recognitions: NSArray? = NSArray()
    var camera : GMSCameraPosition = GMSCameraPosition()
    var mapView : GMSMapView = GMSMapView()
    //@IBOutlet weak var tableViewMenu: UITableView!
    
    @IBOutlet weak var mapUIView: UIView!
    @IBOutlet weak var camButton0: UIButton!
    @IBOutlet weak var camButton1: UIButton!
    @IBOutlet weak var camButton2: UIButton!
    @IBOutlet weak var nameCam0: UILabel!
    @IBOutlet weak var nameCam1: UILabel!
    @IBOutlet weak var nameCam2: UILabel!
    @IBOutlet weak var detailsCam0: UILabel!
    @IBOutlet weak var detailsCam1: UILabel!
    @IBOutlet weak var detailsCam2: UILabel!
    @IBOutlet weak var labelMainMessage: UILabel!
    
    @IBOutlet weak var popupCamLabel: UILabel!
    @IBOutlet weak var popupCamImage: UIImageView!
    @IBOutlet weak var popupCloseButton: UIButton!
    @IBOutlet weak var popupView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        super.setBG()
        labelMainMessage.lineBreakMode = .ByWordWrapping // or NSLineBreakMode.ByWordWrapping
        labelMainMessage.numberOfLines = 2
        self.loadJSON()
        self.showPopupWithStyle()
    }
    
    override func viewDidAppear(animated: Bool) {
        // borders around safety info
    }
    
    override func viewDidLayoutSubviews() {
        
    }
    
    override func viewWillAppear(animated: Bool) {
        //self.tableViewMenu.tableFooterView = UIView(frame: CGRectZero)
        self.title = ""
        self.navigationController?.navigationBar.barTintColor = UIColor.whiteColor()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.redColor()]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showPopupWithStyle() {
        // borders around safety info
        
    }
    
    func loadJSON(){
        var parameters: Dictionary<String,String>?
        self.camButton0.tag = 1
        self.camButton1.tag = 2
        self.camButton2.tag = 3
        self.camButton0.addTarget(self, action: "pressed:", forControlEvents: .TouchUpInside)
        self.camButton1.addTarget(self, action: "pressed:", forControlEvents: .TouchUpInside)
        self.camButton2.addTarget(self, action: "pressed:", forControlEvents: .TouchUpInside)
        self.popupCloseButton.addTarget(self, action: "closePopup:", forControlEvents: .TouchUpInside)
        
        var overlayView = UIView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height))
        var activityView = UIActivityIndicatorView(activityIndicatorStyle: .WhiteLarge)
        activityView.center = self.view.center
        activityView.layer.cornerRadius = 05;
        activityView.opaque = false;
        activityView.center = overlayView.center
        activityView.startAnimating()
        overlayView.backgroundColor = UIColor(white: 0.0, alpha:0.6)
        overlayView.addSubview(activityView)
        self.view.addSubview(overlayView)
        Alamofire.request(.GET, "http://api.trafficland.com/v1/json/video_feeds/poi?system=smash&key=3953e9e63b8f06a95eb498926fe4e30a&lat=40.6698&lon=-73.94384&radius=3.5", parameters: parameters)
            .responseJSON{ (request, response, data, error) in
                println(request)
                println(response)
                println(data)
                println(error)
                
                
                var cams = JSON(data!)
                if (cams != nil && cams.count > 0){
                    self.nameCam0.text = "Cam " + cams[0]["publicId"].stringValue
                    self.nameCam1.text = "Cam " + cams[1]["publicId"].stringValue
                    self.nameCam2.text = "Cam " + cams[2]["publicId"].stringValue
                    self.detailsCam0.text = "   " + cams[0]["name"].stringValue
                    self.detailsCam1.text = "   " + cams[1]["name"].stringValue
                    self.detailsCam2.text = "   " + cams[2]["name"].stringValue
                    self.imagesURLs.append(cams[0]["content"]["hugeJpeg"].stringValue)
                    self.imagesURLs.append(cams[1]["content"]["hugeJpeg"].stringValue)
                    self.imagesURLs.append(cams[2]["content"]["hugeJpeg"].stringValue)
                    SharedData.sharedInstance.allCams = []
                }
                
                var n : Int = 0
                self.camera = GMSCameraPosition.cameraWithLatitude(40.6698,
                    longitude:-73.94384, zoom:12)
                self.mapView = GMSMapView.mapWithFrame(CGRectMake(0, 0, self.mapUIView.frame.width, self.mapUIView.frame.height), camera:self.camera)
                
                var marker = GMSMarker()
                for (n = 0; n < cams.count; n++){
                    var cCam : Cam = Cam()
                    cCam.name = "Cam " + cams[n]["publicId"].stringValue
                    cCam.detail = cams[n]["name"].stringValue
                    cCam.url = cams[n]["content"]["hugeJpeg"].stringValue
                    var urlStr: NSString = cCam.url!
                    urlStr = urlStr.stringByReplacingOccurrencesOfString(" ", withString: "%20")
                    var url = NSURL(string: urlStr)
                    //cCam.data = NSData(contentsOfURL: url!)
                    var cords = cams[n]["location"]["coordinates"]
                    marker = GMSMarker()
                    marker.position = CLLocationCoordinate2D(latitude: cords[1].doubleValue, longitude: cords[0].doubleValue)
                    marker.snippet = ""
                    marker.appearAnimation = kGMSMarkerAnimationPop
                    marker.map = self.mapView
                    SharedData.sharedInstance.allCams.append(cCam)
                }
                self.mapUIView.addSubview(self.mapView)
                overlayView.removeFromSuperview()
        }
    }
    
    func pressed(sender: UIButton!) {
        self.popupView.hidden = false
        self.popupCamLabel.text = SharedData.sharedInstance.allCams[sender.tag - 1].name
        self.loadCamImage(sender.tag - 1)
    }
    
    func loadCamImage(index : Int){
        var urlStr: NSString = self.imagesURLs[index]
        urlStr = urlStr.stringByReplacingOccurrencesOfString(" ", withString: "%20")
        var url = NSURL(string: urlStr)
        let data = NSData(contentsOfURL: url!)
        self.popupCamImage.image =  UIImage(data: data!)
        if (!self.popupView.hidden){
            let delayTime = dispatch_time(DISPATCH_TIME_NOW,
                Int64(1 * Double(NSEC_PER_SEC)))
            println(delayTime)
            dispatch_after(delayTime, dispatch_get_main_queue()) {
                self.loadCamImage(index)
            }
        }
    }
    
    func closePopup(sender: UIButton!) {
        self.popupView.hidden = true
    }
    
}
