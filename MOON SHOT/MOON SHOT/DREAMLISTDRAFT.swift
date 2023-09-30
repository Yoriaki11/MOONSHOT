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
    
    @Environment(\.managedObjectContext) var viewContext
    
    var body: some View {
        TextField("夢や目標を入力してください", text: $taskTitle,onCommit: {
                self.createTask()
                self.dREAMLISTDATA.isEditing = false
        })
    }
    func createTask(){
        let newTask = Dream(context: viewContext)
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

struct DREAMLISTDRAFT_Previews: PreviewProvider {
    static var previews: some View {
        DREAMLISTDRAFT()
    }
}
