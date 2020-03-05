//
//  Task+Convenience.swift
//  Task
//
//  Created by David on 3/4/20.
//  Copyright © 2020 Karl Pfister. All rights reserved.
//

import Foundation
import CoreData

extension Task {
    
    @discardableResult
    
    convenience init(name: String, notes: String? = nil, due: Date? = nil, isComplete: Bool = false, context: NSManagedObjectContext = CoreDataStack.context) {
        //convenience initializer for the task format
        self.init(context: context)

        self.name = name
        self.notes = notes
        self.due = due
        self.isComplete = false
    }
}


