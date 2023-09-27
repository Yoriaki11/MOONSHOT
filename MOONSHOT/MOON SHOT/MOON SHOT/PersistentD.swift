//
//  PersistentD.swift
//  MOON SHOT
//
//  Created by 杉本 頼亮 on 2023/09/27.
//

import CoreData

struct PersistenceControllerD{
    let container: NSPersistentContainer
    
    init(){
        container = NSPersistentContainer(name:"ModelD")
        
        container.loadPersistentStores(completionHandler:{(storeDescription,error)in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
}

