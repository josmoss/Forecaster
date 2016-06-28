//
//  CitiesTableViewController.swift
//  ForecasterApp
//
//  Created by Joe Moss on 6/28/16.
//  Copyright © 2016 Iron Yard_Joe Moss. All rights reserved.
//

import UIKit
import CoreLocation

class CitiesTableViewController: UITableViewController {

    var citiesArray = [City]()
    var cityName: String = ""
    var zipCode: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func addButtonTapped(sender: UIBarButtonItem) {
        // Create AlertController
        let alertController = UIAlertController(title: "Add City", message: "", preferredStyle: UIAlertControllerStyle.Alert)
        
        // Create the Save Action with textfields
        let saveAction = UIAlertAction(title: "Save", style: UIAlertActionStyle.Default, handler: {
            alert -> Void in
            
            let firstTextField = alertController.textFields![0] as UITextField
            let secondTextField = alertController.textFields![1] as UITextField
            
            if let name = firstTextField.text {
                self.cityName = name
                print("check name")
            }
            
            if let code = secondTextField.text {
                self.zipCode = code
                print("check code")
            }
            
            // call geocode
            self.geocoding(self.zipCode, completion: {(latitude, longitude) in
            
            
            })
            
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: {
            (action : UIAlertAction!) -> Void in
        })
        
        alertController.addTextFieldWithConfigurationHandler { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter City Name"
        }
        alertController.addTextFieldWithConfigurationHandler { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter Zipcode"
        }
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
        
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
