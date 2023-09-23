//
//  DREAMLISTDRAFT.swift
//  MOON SHOT
//
//  Created by 杉本 頼亮 on 2023/09/23.
//

import SwiftUI

struct DREAMLISTDRAFT: View {
    @State var taskTitle = ""
    @EnvironmentObject var dREAMLISTDATA: DREAMLISTDATA
    
    var body: some View {
        TextField("あなたの夢を入力してください", text: $taskTitle,onCommit: {
                self.createTask()
        })
    }
    func createTask(){
        let newTask = TaskD(title: self.taskTitle, checked: false)
        self.dREAMLISTDATA.tasks.insert(newTask, at: 0)
        self.taskTitle = ""
    }
}

struct DREAMLISTDRAFT_Previews: PreviewProvider {
    static var previews: some View {
        DREAMLISTDRAFT()
    }
}
