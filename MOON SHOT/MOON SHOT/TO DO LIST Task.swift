//
//  TO DO LIST Task.swift
//  MOON SHOT
//
//  Created by 杉本 頼亮 on 2023/09/18.
//

import SwiftUI

struct Task:Equatable,Identifiable{
    let id = UUID()
    var title: String
    var checked: Bool
    
    init(title: String, checked: Bool){
        self.title = title
        self.checked = checked
    }
}
