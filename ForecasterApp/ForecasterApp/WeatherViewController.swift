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
    
    @IBOutlet weak var currentImageView: UIImageView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    
    var theCity : City?
    let apiController = WeatherAPIController ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.apiController.delegate = self
    }
    
    func passWeather(theWeather: Weather) {
//      implement the Weather user interface

//      print(theWeather.icon)
//      print(theWeather.temperature)
        
        dispatch_async(dispatch_get_main_queue(), {
        
        // Updating the UI
        self.cityLabel.text = self.theCity?.name
        
        let temp = Int(theWeather.temperature)
        
        self.temperatureLabel.text = "\(temp)"
        self.humidityLabel.text = "\(theWeather.humidity)"
        self.summaryLabel.text = "\(theWeather.summary)"
        
        self.currentImageView.image = UIImage(named: theWeather.icon)
        print(theWeather.icon)
        
        })
        
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if let city = self.theCity {
            
            self.cityLabel.text = city.name
        
            let latlong = "\(city.latitude)" + "," + "\(city.longitude)"
        
            apiController.fetchWeather(latlong)
        }
        
    }

}
