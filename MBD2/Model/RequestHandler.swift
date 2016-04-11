//
//  RequestHandler.swift
//  MBD2
//
//  Created by Jelte van Tartwijk on 09/04/16.
//  Copyright © 2016 Jelte van Tartwijk. All rights reserved.
//

import Foundation

class RequestHandler {

    class func sendGetRequest<T: Result>(url: String, result: (T) -> Void, error: (NSError) -> Void) {
        
        let request = NSMutableURLRequest(URL: NSURL(string: url)!)
        
        request.HTTPMethod = HTTPMethod.Get.value
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, ApiError in
            
            if(ApiError != nil) {
                error(ApiError!)
            }
            
            do {
                if let convertedJsonIntoDict = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as? NSDictionary {
                    // Print out dictionary
//                    print(convertedJsonIntoDict)
                    result(T(convertedJsonIntoDict))
                    
                }
            } catch let convertError as NSError {
                error(convertError)
            }
        
        }        
        task.resume()
    }
    
}