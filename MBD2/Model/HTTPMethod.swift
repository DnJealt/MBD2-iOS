//
//  HTTPMethod.swift
//  SnapSome
//
//  Created by Jelte van Tartwijk on 28-10-15.
//  Copyright © 2015 Raak ICT BV. All rights reserved.
//

import Foundation


///An enum containing all the possible HTTP methods as String values
enum HTTPMethod: String {
    ///HTTPPost, use .value to get the actual string
    case Post = "POST"
    ///HTTPGet, use .value to get the actual string
    case Get = "GET"
    ///HTTPPut, use .value to get the actual string
    case Put = "PUT"
    ///HTTPPatch, use .value to get the actual string
    case Patch = "PATCH"
    ///HTTPDelete, use .value to get the actual string
    case Delete = "DELETE"
    ///HTTPOptions, use .value to get the actual string
    case Options = "OPTIONS"
    ///HTTPConnect, use .value to get the actual string
    case Connect = "CONNECT"
    ///HTTPTrace, use .value to get the actual string
    case Trace = "TRACE"
    ///HTTPHead use .value to get the actual string
    case Head = "HEAD"
    
    ///Gets the String representation of the status code
    var value: String {
        return self.rawValue
    }
}