//
//  PokeListResult.swift
//  MBD2
//
//  Created by Jelte van Tartwijk on 10/04/16.
//  Copyright © 2016 Jelte van Tartwijk. All rights reserved.
//

import Foundation

class PokeListResult : Result {
    
    let dict: Dictionary<String, AnyObject>
    
    required init(_ dict: NSDictionary!) {
        self.dict = dict as! Dictionary<String, AnyObject>
    }
    
    func getValue() -> NSDictionary {
        return self.dict
    }
    
    func getAllNames() -> [String] {
        let entries = dict["pokemon_entries"] as! [AnyObject]
        var names: [String] = []
        
        
        for var a in entries { //stfu swift
            let species = a["pokemon_species"] as! Dictionary<String, String>
            let name: String = species["name"]! as String
            
            names.append(name)
        }
        
        return names
    }
    
}
