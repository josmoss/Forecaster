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
        
            if let summaryWeather = dict["summary"] as? String {
                self.summary = summaryWeather
            } else {
                print("I could not parse the summary")
            }
            
            if let iconName = dict["icon"] as? String {
                self.icon = iconName
            } else {
                print("I could not parse the icon")
            }
        
            if let precipProbability = dict["precipProbability"] as? Double {
                self.precipProbability = precipProbability
            } else {
                print("I could not parse the precipProbablitiy")
            }
            
            if let temperature = dict["temperature"] as? Double {
                self.temperature = temperature
            } else {
                print("I could not parse the temperature")
            }

            if let humidity = dict["humidity"] as? Double {
                self.humidity = humidity
            } else {
                print("I could not parse the summary")
            }
            
            if let windSpeed = dict["windSpeed"] as? Double {
                self.windSpeed = windSpeed
            } else {
                print("I could not parse the icon")
            }

    }

}
