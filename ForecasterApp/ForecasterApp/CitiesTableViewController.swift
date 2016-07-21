//
//  CitiesTableViewController.swift
//  ForecasterApp
//
//  Created by Joe Moss on 6/28/16.
//  Copyright © 2016 Iron Yard_Joe Moss. All rights reserved.
//

import UIKit
import CoreLocation

let kCITIES = "kCITIES"

class CitiesTableViewController: UITableViewController {

    var currentCity : City?
    var citiesArray = [City]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadDefaults()
        
    }
    
    @IBAction func addButtonTapped(sender: UIBarButtonItem) {
        
            // Create an instance of the UIAlertController class - style .Alert
            
            let alert = UIAlertController(title: "Add Name",
                                          message: "Add a new name", preferredStyle: .Alert)
            

            let saveAction = UIAlertAction(title: "Save",
                                           style: .Default,
                                           handler: {
                                            (action) in
                                            
                                            self.currentCity = City()
                                            
                                            if let textField = alert.textFields?.first {
                                                
                                                if let name = textField.text {
                                                    print(name)
                                                    self.currentCity?.name = name
                                                }
                                            }
                                            
                                            if let zipTextField = alert.textFields?[1] {
                                                
                                                if let zipcode = zipTextField.text {
                                                    print(zipcode)
                                                    
                                                    self.currentCity?.zipcode = zipcode
                                                    
                                                    // Start Geocoding Process
                                                    self.geocoding(zipcode, completion: {
                                                        (latitude, longitude) in
                                                        
                                                        print(latitude)
                                                        print(longitude)
                                                        
                                                        self.currentCity?.latitude = latitude
                                                        self.currentCity?.longitude = longitude
                                                        
                                                        
                                                        if let current = self.currentCity {
                                                            
                                                            dispatch_async(dispatch_get_main_queue(), {
                                                                self.citiesArray.append(current)
                                                                self.saveDefaults()
                                                                self.tableView.reloadData()
                                                            })
                                                            
                                                            
                                                        }
                                                        
                                                        
                                                    })
                                                
                                                }
                                                
                                            }
            })

            // Add the action to the alert instance
            alert.addAction(saveAction)
            
            // Create an action called Cancel
            
            let cancelAction = UIAlertAction(title: "Cancel",
                                             style: .Default) {
                                                (action) in
            }
            
            // Add the cancel action
            alert.addAction(cancelAction)
            
            
            // Add a textfield to the AlertController
            
            alert.addTextFieldWithConfigurationHandler {
                (textField) in
                
                // configure the placeholder text
                textField.placeholder = "City Name"
            }
            
            // Add a textfield to the AlertController
            
            alert.addTextFieldWithConfigurationHandler {
                (textField) in
                
                // configure the placeholder text
                textField.placeholder = "Zipcode"
            }

            
            // Present the alert using presentViewController
            self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
     override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.citiesArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! CitiesTableViewCell
        
        let cityName = self.citiesArray[indexPath.row]
        
        cell.nameLabel.text = cityName.name
        cell.zipLabel.text = cityName.zipcode
        
        return cell
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.currentCity = self.citiesArray[indexPath.row]
        
        performSegueWithIdentifier("WeatherSegue", sender: nil)
    
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "WeatherSegue" {
            
            if let controller = segue.destinationViewController as? WeatherViewController {
                
                controller.theCity = self.currentCity
            } else {
                print("Not the correct segue")
            }
        }
        
    }
    
    func saveDefaults() {
        
        let data = NSKeyedArchiver.archivedDataWithRootObject(self.citiesArray)
        
        NSUserDefaults.standardUserDefaults().setObject(data, forKey: kCITIES)
        
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func loadDefaults() {
        
        if let data = NSUserDefaults.standardUserDefaults().objectForKey(kCITIES) as? NSData {
            
            if let arrayOfCities = NSKeyedUnarchiver.unarchiveObjectWithData(data) as? [City] {
                
                self.citiesArray = arrayOfCities
                self.tableView.reloadData()
            }
            
        } else {
            
            print("no items saved")
        }
        
    }
    
    func geocoding(location: String, completion: (Double, Double) -> ()) {
        
        
        CLGeocoder().geocodeAddressString(location) {
            
            (placemarks, error) in
            
            if placemarks?.count > 0 {
                let placemark = placemarks?[0]
                let location = placemark!.location
                let coordinate = location?.coordinate
                completion((coordinate?.latitude)!, (coordinate?.longitude)!)
            }
        }
    }
}
