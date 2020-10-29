//
//  NSManagedObject+Extension.swift
//  Swifty-Extensions
//
//  Created by Milan Panchal on 12/10/20.
//  Copyright © 2020 Jeenal Infotech. All rights reserved.
//

import UIKit
import CoreData

extension NSManagedObject {

     /// Returns the entity name for the current class.
     
     static var entityName: String {
         return String(describing: self)
     }
          
     /// Returns the entity description for the current class.
     
     static var entityDescription: NSEntityDescription {
         return NSEntityDescription.entity(forEntityName: entityName, in: managedObjectContext)!
     }
     
     /// Returns the current managed object context.
     
     static var managedObjectContext: NSManagedObjectContext {
         return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
     }
     
    class var totalRecords: Int {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        do {
            return try managedObjectContext.count(for: request)
        } catch {
            debugPrint(error.localizedDescription)
            return 0
        }
    }
    
    /// Delete all objects of the current entity.
    
    class func deleteAll() throws {
        
        do {
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
            let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: request)
            try managedObjectContext.execute(batchDeleteRequest)
            
        } catch let deleteAllError {
            fatalError("Delete All Error for \(entityName): \(deleteAllError)")
        }
        
        do {
            try managedObjectContext.save()
        } catch let deleteError {
            fatalError("Failed deleting \(deleteError)")
        }
    }

    /// Fetch all objects of the current entity.

    class func fetchAll<T: NSManagedObject>() throws -> [T]? {
        do {
            return try fetch(predicate: nil, sortDescriptor: nil)
        } catch let fetchAllError {
            fatalError("Fetch All Error for \(entityName): \(fetchAllError)")
        }
        
    }
    
    /// Fetch all objects of the current entity based on predicate.
    
    class func fetch<T: NSManagedObject>(predicate: NSPredicate?=nil, sortDescriptor: NSSortDescriptor?=nil) throws -> [T]? {

        do {
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)

            // Add predicate if any
            if let predicate = predicate {
                request.predicate = predicate
            }
            
            // Add sortDescriptor if any
            if let sortDescriptor = sortDescriptor {
                request.sortDescriptors = [sortDescriptor]
            }

            let fetchData = try managedObjectContext.fetch(request)
            return fetchData as? [T]
                                
        } catch let fetchError {
            fatalError("Fetch Error for \(entityName): \(fetchError)")
        }
        
    }
}
