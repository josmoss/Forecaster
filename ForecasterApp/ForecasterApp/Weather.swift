//
//  Weather.swift
//  ForecasterApp
//
//  Created by Joe Moss on 6/29/16.
//  Copyright © 2016 Iron Yard_Joe Moss. All rights reserved.
//

import UIKit

class Weather: NSObject {
    
    var summary: String = ""
    var icon: String = ""
    var precipProbability: Double = 0.0
    var temperature: Double = 0.0
    var humidity: Double = 0.0
    var windSpeed: Double = 0.0
    
    override init() {
        super.init()
    }

    init(dict: JSONDictionary) {
        super.init()
        
        if let currentlyDict = dict["currently"] as? JSONDictionary {
        
            if let summaryWeather = currentlyDict["summary"] as? String {
                self.summary = summaryWeather
            } else {
                print("I could not parse the summary")
            }
            
            if let iconName = currentlyDict["icon"] as? String {
                self.icon = iconName
            } else {
                print("I could not parse the icon")
            }
        
        }
        
    }

}
