//
//  StorageUtility.swift
//  MBD2
//
//  Created by Jelte van Tartwijk on 11/04/16.
//  Copyright © 2016 Jelte van Tartwijk. All rights reserved.
//

import Foundation

class StorageUtility {
    
    private let defaults = NSUserDefaults.standardUserDefaults()
    
    func storeNames(key: String, names: [String]){
        
        defaults.setObject(names, forKey: key)
    }
    
    func getNames(key: String) -> [String]{
        
        let obj = defaults.arrayForKey(key) as? [String]
        
        if(obj != nil){
            return obj!
        }
        else{
            return []
        }
    }
    
    ///Appends a String to a cached String array, and creates one if the array doesn't exist yet
    func appendToArray(key: String, item: String){
        
        var obj = defaults.arrayForKey(key) as? [String]
        
        if(obj != nil){
            obj!.append(item)
        }
        else{
            // Create a new array with the specified item
            obj = [item]
        }
        
        // Store the new array again
        storeNames(key, names: obj!)
        
    }
    
    ///Checks if a name is present in a cached String array
    func containsName(key:String, item:String) -> Bool{
        
        let obj = defaults.arrayForKey(key) as? [String]
        
        if(obj != nil){
            if(obj!.contains(item)){
                return true
            }
        }
        return false
    }
    
}