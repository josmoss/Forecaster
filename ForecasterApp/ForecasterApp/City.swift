//
//  City.swift
//  ForecasterApp
//
//  Created by Joe Moss on 6/28/16.
//  Copyright © 2016 Iron Yard_Joe Moss. All rights reserved.
//

import UIKit

class City: NSObject {
    
    var name: String = ""
    var zipcode: String = ""
    var latitude: Double = 0.0
    var longitude: Double = 0.0
    
    override init() {
        super.init()
        
        self.name = ""
        self.zipcode = ""
        self.latitude = 0.0
        self.longitude  = 0.0
        
    }

}
