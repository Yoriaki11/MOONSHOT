//
//  TO DO LIST Draft.swift
//  MOON SHOT
//
//  Created by 杉本 頼亮 on 2023/09/18.
//

import SwiftUI

struct TO_DO_LIST_Draft: View {
    @State var taskTitle = ""
    @EnvironmentObject var to_DO_LIST_Data: TO_DO_LIST_Data
    
    var body: some View {
        TextField("タスクを入力してください",text: $taskTitle,onCommit:{
            self.createTask()
            self.to_DO_LIST_Data.isEditing = false
        })

        
    }
    func createTask(){
        let newTask = Task(title: self.taskTitle,checked:false)
        self.to_DO_LIST_Data.tasks.insert(newTask, at: 0)
        self.taskTitle = ""
    }
}

struct TO_DO_LIST_Draft_Previews: PreviewProvider {
    static var previews: some View {
        TO_DO_LIST_Draft()
    }
}
