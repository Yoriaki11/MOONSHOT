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
    
    @Environment(\.managedObjectContext) var viewContext
    
    var body: some View {
      TextField("身に付けたい習慣を入力してください", text: $taskTitle, onCommit: {
          self.createTask()
          self.habitListData.isEditing = false
      })
    }
    
    func createTask(){
        let newTask = Habit(context: viewContext)
        newTask.title = self.taskTitle
        newTask.checked = false
        self.taskTitle = ""
        
        do{
            try viewContext.save()
        }catch {
            fatalError("セーブに失敗")
        }
    }
}

struct HabitListDraft_Previews: PreviewProvider {
    static var previews: some View {
        HabitListDraft()
    }
}
