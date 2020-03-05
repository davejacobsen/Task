//
//  Date.swift
//  Task
//
//  Created by David on 3/4/20.
//  Copyright © 2020 Karl Pfister. All rights reserved.
//

import Foundation

extension Date {

    /**
     Sets Formatting for out dates. Returns a String

     ## Important Notes ##
     1. This extends a Date; so it is usable on all Date objects
     2. Currently Set to medium Date length
     */
//    func stringValue() -> String {
//        let formatter = DateFormatter()
//        formatter.dateStyle = .medium
//        return formatter.string(from: self)
//    }
    
    var formatted: String {
        let formatter = DateFormatter()
        formatter.timeStyle = .none
        formatter.dateStyle = .medium
        return formatter.string(from: self)
    }
    
    
}
