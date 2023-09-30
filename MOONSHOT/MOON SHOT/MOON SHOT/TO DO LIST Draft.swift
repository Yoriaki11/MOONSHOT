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
    
    @Environment(\.managedObjectContext) var viewContext
    
    var body: some View {
        TextField("あなたのタスクを入力してください",text: $taskTitle,onCommit:{
            self.createTask()
            self.to_DO_LIST_Data.isEditing = false
        })

        
    }
    func createTask(){
        let newTask = Todo(context: viewContext)
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

struct TO_DO_LIST_Draft_Previews: PreviewProvider {
    static var previews: some View {
        TO_DO_LIST_Draft()
    }
}
