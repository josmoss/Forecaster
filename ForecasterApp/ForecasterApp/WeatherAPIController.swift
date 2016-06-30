//
//  WeatherAPIController.swift
//  ForecasterApp
//
//  Created by Joe Moss on 6/29/16.
//  Copyright © 2016 Iron Yard_Joe Moss. All rights reserved.
//

import UIKit

class WeatherAPIController: NSObject {
    
    let session = NSURLSession.sharedSession()
    
    func fetchWeather(latlong: String) {
        
        // 1. Load URLString for the API Call
        let urlString = "https://api.forecast.io/forecast/f8fd1bf1ef483fb79f068ceea4fef13c/\(latlong)"
        //print(urlString)
        
        if let url = NSURL(string: urlString) {
            
            let task = session.dataTaskWithURL(url, completionHandler: {
                
                (data, response, error) in
                
                // Step 1 of parsing JSON data
                if error != nil {
                    print(error?.localizedDescription)
                    return
                }
                // Step 2 parse the data
                if let data = data {
                    
                    do {
                        // Root Level 1
                        if let jsonDictionary = try NSJSONSerialization.JSONObjectWithData(data, options: []) as? JSONDictionary {
                            print(jsonDictionary)
                            
                            // Level 2
                            if let itemsArray = jsonDictionary["items"] as? JSONArray {
                                
                                // Loop
                                for itemDict in itemsArray {
                                    
                                }
                                
                            }
                        
                        }
                        
                    } catch {
                        print("I could not parse the jsonDictionary")
                    }
                    
                } else {
                    print("I could not unwrap the data")
                }
                
                })
                task.resume()
            
        } else {
            print("Not a valid url")
        }
        
    }

}
