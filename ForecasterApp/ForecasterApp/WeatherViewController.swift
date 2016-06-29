//
//  WeatherViewController.swift
//  ForecasterApp
//
//  Created by Joe Moss on 6/29/16.
//  Copyright © 2016 Iron Yard_Joe Moss. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    var theCity : City?

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if let city = self.theCity {
            
            self.cityLabel.text = city.name
        }
        
    }

    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!


}
