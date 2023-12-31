//
//  TO DO LIST.swift
//  MOON SHOT
//
//  Created by 杉本 頼亮 on 2023/09/17.
//

import SwiftUI
import CoreData

struct TO_DO_LIST: View {
    @EnvironmentObject var to_DO_LIST_Data: TO_DO_LIST_Data
    
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(sortDescriptors: [])
    var tasks: FetchedResults<Todo>
    
    var body: some View {
        NavigationView{
            List{
                ForEach(tasks) { task in
                    Button(action: {
                        task.checked.toggle()
                    })
                    {
                        if((task.title?.isEmpty) == false){ TO_DO_LIST_Row(task: task.title!, isCheck: task.checked)
                        }
                    }
                }
                
                if self.to_DO_LIST_Data.isEditing{
                    TO_DO_LIST_Draft()
                }
                else {
                    Button(action: {
                        self.to_DO_LIST_Data.isEditing = true
                    })
                    {
                        Text("+")
                            .font(.title)
                    }
                }
            }
            .navigationBarTitle(Text("TO DO LIST"))
            .navigationBarItems(trailing:Button(action: {
              DeleteTask()
            })
            {
                Text("Delete")
            }
            )
        }
    }
    func DeleteTask(){
        for task in tasks {
            if(task.checked){
                viewContext.delete(task)
            }
        }
        
        do{
            try viewContext.save()
        } catch {
            fatalError("セーブに失敗")
        }
    }
}

struct TO_DO_LIST_Previews: PreviewProvider {
    static var previews: some View {
        TO_DO_LIST()
            .environmentObject(TO_DO_LIST_Data())
    }
}
