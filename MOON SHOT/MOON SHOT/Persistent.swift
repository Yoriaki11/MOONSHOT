//
//  PersistentT.swift
//  MOON SHOT
//
//  Created by 杉本 頼亮 on 2023/09/24.
//

import CoreData

struct PersistenceController{
    let container: NSPersistentContainer
    
    init(){
        container = NSPersistentContainer(name:"Model")
        
        container.loadPersistentStores(completionHandler:{(storeDescription,error)in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
}
