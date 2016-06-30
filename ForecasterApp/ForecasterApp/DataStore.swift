//
//  DataStore.swift
//  ForecasterApp
//
//  Created by Joe Moss on 6/29/16.
//  Copyright © 2016 Iron Yard_Joe Moss. All rights reserved.
//

import UIKit

class DataStore: NSObject {
    
    // Making it a singleton
    static let sharedInstance = DataStore()
    override private init() { }
    
    var citiesArray = [City]()
    
    func addCity(cit: City) {
        
        self.citiesArray.append(cit)
    }
    
    func numberOfCities() -> Int {
        return self.citiesArray.count
    }
    
    func removeAllCities() {
        self.citiesArray.removeAll()
    }
    
    func cityAtIndex(index: Int) -> City? {
        
        if self.citiesArray.count >= index {
            return self.citiesArray[index]
        }
        return nil
    }

}
