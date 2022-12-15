//
//  TaskDataManager.swift
//  ToDoListStarter
//
//  Created by Rafael González on 14/12/22.
//

import Foundation
import CoreData

class TaskDataManager{
    
    private var task : [Task] = []
    private var context : NSManagedObjectContext
    
    init(context : NSManagedObjectContext){
        self.context = context
    }
    
    func fecth() {
        do{
            self.task = try self.context.fetch(Task.fetchRequest())
        }
        catch{
            print("Error:", error)
        }
    }
    
    func getTask(at index : Int) -> Task {
        return task[index]
    }
    
    func countTask() -> Int {
        return task.count
    }
    
    func pushTask(newtask : Task){
        task.append(newtask)
    }
    
}


