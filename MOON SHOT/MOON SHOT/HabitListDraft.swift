//
//  HabitListDraft.swift
//  MOON SHOT
//
//  Created by 杉本 頼亮 on 2023/09/23.
//

import SwiftUI

struct HabitListDraft: View {
    @State var taskTitle = ""
    @EnvironmentObject var habitListData: HabitListData
    
    var body: some View {
      TextField("身に付けたい習慣を入力してください", text: $taskTitle, onCommit: {
          self.createTask()
          self.habitListData.isEditing = false
      })
    }
    
    func createTask(){
        let newTask = TaskH(title: self.taskTitle, checked: false)
        self.habitListData.tasks.insert(newTask, at: 0)
        self.taskTitle = ""
        
    }
}

struct HabitListDraft_Previews: PreviewProvider {
    static var previews: some View {
        HabitListDraft()
    }
}
