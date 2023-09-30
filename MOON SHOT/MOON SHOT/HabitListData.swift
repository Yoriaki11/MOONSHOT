//
//  HabitListData.swift
//  MOON SHOT
//
//  Created by 杉本 頼亮 on 2023/09/23.
//

import SwiftUI

class HabitListData:ObservableObject {
    @Published var tasks = [
        TaskH(title: "散歩", checked: true),
        TaskH(title: "料理", checked: false),
        TaskH(title: "筋トレ", checked: true)
    ]
    
    @Published var isEditing: Bool = false
}
