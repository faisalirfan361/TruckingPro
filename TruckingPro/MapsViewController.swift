//
//  MapsViewController.swift
//  TruckingPro
//
//  Created by Faisal on 3/10/15.
//  Copyright (c) 2015 Smash Analytics. All rights reserved.
//

import Foundation

class MapsViewController: BaseUIViewController, GMSMapViewDelegate {
    
    @IBOutlet weak var mapsContainer: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        super.setBG()
    }
    
    override func viewDidLayoutSubviews() {
        
        var camera = GMSCameraPosition.cameraWithLatitude(40.6698,
            longitude:-73.94384, zoom:10)
        var mapView = GMSMapView.mapWithFrame(CGRectMake(0, 0, mapsContainer.frame.width, mapsContainer.frame.height), camera:camera)
        var marker = GMSMarker()
        marker.position = camera.target
        marker.snippet = ""
        marker.appearAnimation = kGMSMarkerAnimationPop
        marker.map = mapView
        
        mapsContainer.addSubview(mapView)
    }
}