//
//  TaskController.swift
//  Task
//
//  Created by David on 3/4/20.
//  Copyright © 2020 Karl Pfister. All rights reserved.
//

import Foundation
import CoreData

class TaskController {
     //MARK:- Singleton

       static let shared = TaskController()
    
   var fetchedResultsController: NSFetchedResultsController<Task>
    
    init() {
       //creates request
              let request: NSFetchRequest<Task> = Task.fetchRequest()
              // Add the Sort Descriptors to the request. Sort Descriptors allows us to determine how we want the data organized from the fetch request
              request.sortDescriptors = [NSSortDescriptor(key: "isComplete", ascending: true)]
              // Initialize a NSfetchedResultsController using the Fetch Request we just created
              let resultsController: NSFetchedResultsController<Task> = NSFetchedResultsController(fetchRequest: request, managedObjectContext: CoreDataStack.context, sectionNameKeyPath: "Complete", cacheName: nil)
              // Set the initized NSFRC to our property
              fetchedResultsController = resultsController


              do{ // do/catch will display an error if fetchedResultsController isn't working
                  try fetchedResultsController.performFetch()
              } catch {
                  print("There was an error performing the fetch. \(error.localizedDescription)")
              }
    }
    
//    var mockTasks: [Task] = {
//        let task1 = Task(name: "code", notes: "learn coredata", due: Date(), isComplete: true)
//        let task2 = Task(name: "code more", notes: "learn coredata more", due: Date())
//        let task3 = Task(name: "really code", notes: "really learn coredata", due: Date())
//        return [task1, task2, task3]
//    }()
    
    
    //functions
    
    func toggleIsCompleteFor(task: Task) {
        // Update the isComplete Property on the task to the opposite state
        task.isComplete = !task.isComplete
        // I want this in the Model Controller because the isComplete is a property on my model.
        saveToPersistentStore()
    }

    
    func add(taskWithName name: String, notes: String?, due: Date?) {
        // Do not need to assign this to a property because the initalizer is marked @discardableResult
            Task(name: name, notes: notes, due: due)
            saveToPersistentStore() // defined below
    }
    
    func update(task: Task, name: String, notes: String?, due: Date?) {
        task.name = name
        task.notes = notes
        task.due = due

        saveToPersistentStore()

    }
    func remove(task: Task) {
        CoreDataStack.context.delete(task)
               saveToPersistentStore()
    }
    
    func saveToPersistentStore() {
        do {
            try CoreDataStack.context.save()
        } catch {
            print("Error saving")
        }
        
    }
}
