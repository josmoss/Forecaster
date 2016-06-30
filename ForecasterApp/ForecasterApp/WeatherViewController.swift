//
//  WeatherViewController.swift
//  ForecasterApp
//
//  Created by Joe Moss on 6/29/16.
//  Copyright © 2016 Iron Yard_Joe Moss. All rights reserved.
//

import UIKit

protocol WeatherDelegate : class {
    func passWeather(theWeather: Weather)
}

class WeatherViewController: UIViewController, WeatherDelegate {
    
    var theCity : City?
    let apiController = WeatherAPIController ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.apiController.delegate = self
    }
    
    func passWeather(theWeather: Weather) {
        // implement the Weather user interface
        
//        print(theWeather.icon)
//        print(theWeather.temperature)
        
        // Updating the UI
        self.cityLabel.text = theCity?.name
        
        let temp = Int(theWeather.temperature)
        
        self.temperatureLabel.text = "\(temp)"
        self.humidityLabel.text = "\(theWeather.humidity)"
        
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if let city = self.theCity {
            
            self.cityLabel.text = city.name
        
            let latlong = "\(city.latitude)" + "," + "\(city.longitude)"
        
            apiController.fetchWeather(latlong)
        }
        
    }

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!

}
