//
//  DREAMLISTDATA.swift
//  MOON SHOT
//
//  Created by 杉本 頼亮 on 2023/09/23.
//

import SwiftUI

class DREAMLISTDATA:ObservableObject{
   @Published var tasks = [
        TaskD(title: "ランニング", checked: true),
        TaskD(title: "クッキング", checked: false),
        TaskD(title: "トレーニング", checked: true)
    ]
    
    @Published var isEditing: Bool = false
}
