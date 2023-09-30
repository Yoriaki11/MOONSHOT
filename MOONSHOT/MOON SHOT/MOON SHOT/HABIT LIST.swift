//
//  HABIT LIST.swift
//  MOON SHOT
//
//  Created by 杉本 頼亮 on 2023/09/17.
//

import SwiftUI
import CoreData


struct HABIT_LIST: View {
    @EnvironmentObject var habitListData: HabitListData
    
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(sortDescriptors: [])
    var tasks: FetchedResults<Habit>
    
    var body: some View {
        NavigationView{
            List{
                ForEach(tasks) { task in
                    Button(action: {
                        task.checked.toggle()
                    })
                    {
                        if((task.title?.isEmpty) == false) {
                            HabitListRow(task: task.title!, isCheck: task.checked)
                     }
                    }
                    
                }
                if self.habitListData.isEditing{
                    HabitListDraft()
                }
                else{
                    Button(action:{
                        self.habitListData.isEditing = true
                    })
                {
                    Text("+")
                        .font(.title)
                }
            }
            }
            .navigationBarTitle(Text("HABIT LIST"))
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

struct HABIT_LIST_Previews: PreviewProvider {
    static var previews: some View {
        HABIT_LIST()
            .environmentObject(HabitListData())
    }
}
