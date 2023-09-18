//
//  TO DO LIST Data.swift
//  MOON SHOT
//
//  Created by 杉本 頼亮 on 2023/09/18.
//

import SwiftUI

class TO_DO_LIST_Data: ObservableObject{
    @Published var tasks = [
        Task(title: "散歩", checked: true),
        Task(title: "料理", checked: false),
        Task(title: "筋トレ", checked: true)
        
    ]
    
    @Published var isEditing: Bool = false
}

