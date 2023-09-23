//
//  MOON_SHOTApp.swift
//  MOON SHOT
//
//  Created by 杉本 頼亮 on 2023/09/16.
//

import SwiftUI

@main
struct MOON_SHOTApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(TO_DO_LIST_Data())
                .environmentObject(DREAMLISTDATA())
        }
    }
}
