//
//  MOON_SHOTApp.swift
//  MOON SHOT
//
//  Created by 杉本 頼亮 on 2023/09/16.
//

import SwiftUI

@main
struct MOON_SHOTApp: App {
    let persistenceController = PersistenceController()
    let persistenceControllerD = PersistenceControllerD()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(TO_DO_LIST_Data())
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            
                .environmentObject(DREAMLISTDATA())
                .environment(\.managedObjectContext, persistenceControllerD.container.viewContext)
            
                .environmentObject(HabitListData())
        }
    }
}
