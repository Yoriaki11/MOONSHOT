//
//  HABIT LIST.swift
//  MOON SHOT
//
//  Created by 杉本 頼亮 on 2023/09/17.
//

import SwiftUI



struct HABIT_LIST: View {
    @EnvironmentObject var habitListData: HabitListData
    
    var body: some View {
        NavigationView{
            List{
                ForEach(habitListData.tasks) { task in
                    Button(action: {
                        guard let index = self.habitListData.tasks.firstIndex(of: task)else{
                            return
                        }
                        
                        self.habitListData.tasks[index].checked.toggle()
                    })
                    {
                        HabitListRow(task: task.title, isCheck: task.checked)
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
        let necessaryTask = self.habitListData.tasks.filter({!$0.checked})
        self.habitListData.tasks = necessaryTask
    }
    
}

struct HABIT_LIST_Previews: PreviewProvider {
    static var previews: some View {
        HABIT_LIST()
            .environmentObject(HabitListData())
    }
}
