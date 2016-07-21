//
//  City.swift
//  ForecasterApp
//
//  Created by Joe Moss on 6/28/16.
//  Copyright © 2016 Iron Yard_Joe Moss. All rights reserved.
//

import UIKit

let kTrackName = "trackName"
let kTrackZipcode = "trackZipcode"
let kTrackLatitude = "trackLatitude"
let kTrackLongitude = "trackLongitude"

class City: NSObject, NSCoding {
    
    var name: String = ""
    var zipcode: String = ""
    var latitude: Double = 0.0
    var longitude: Double = 0.0
    
    required init?(coder aDecoder: NSCoder) {
        
        self.name = aDecoder.decodeObjectForKey(kTrackName) as! String
        
        self.zipcode = aDecoder.decodeObjectForKey(kTrackZipcode) as! String
        
        self.latitude = aDecoder.decodeDoubleForKey(kTrackLatitude)
        
        self.longitude = aDecoder.decodeDoubleForKey(kTrackLongitude)
        
        super.init()
    }
    
    override init() {
        super.init()
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: kTrackName)
        
        aCoder.encodeObject(zipcode, forKey: kTrackZipcode)
        
        aCoder.encodeDouble(latitude, forKey: kTrackLatitude)
        
        aCoder.encodeDouble(longitude, forKey: kTrackLongitude)
        
    }
    
}
