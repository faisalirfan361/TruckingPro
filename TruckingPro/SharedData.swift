//
//  SharedData.swift
//  CR-England
//
//  Created by Faisal on 3/9/15.
//  Copyright (c) 2015 Smash Analytics. All rights reserved.
//


import Foundation

class SharedData {
    var allCams : [Cam] = []
    var mapsAPIKey : String = "AIzaSyDPgPdyb62Y2ia7A_6mCgGEEir4SKWsC9E"
    
    private struct Static {
        static var instance: SharedData?
        static var token: dispatch_once_t = 0
    }
    
    class var sharedInstance: SharedData {
        dispatch_once(&Static.token) {
            Static.instance = SharedData()
        }
        return Static.instance!
    }
    
    func clear() {
        Static.token = 0
    }
    
}