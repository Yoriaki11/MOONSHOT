//
//  TO DO LIST.swift
//  MOON SHOT
//
//  Created by 杉本 頼亮 on 2023/09/17.
//

import SwiftUI



struct TO_DO_LIST: View {
    @EnvironmentObject var to_DO_LIST_Data: TO_DO_LIST_Data
    
    var body: some View {
        NavigationView{
            List{
                ForEach(to_DO_LIST_Data.tasks) { task in
                    Button(action: {
                        guard let index = self.to_DO_LIST_Data.tasks.firstIndex(of: task) else{
                            return
                        }
                        
                        self.to_DO_LIST_Data.tasks[index].checked.toggle()
                    })
                    {
                        TO_DO_LIST_Row(task: task.title, isCheck: task.checked)
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
        let necessaryTask = self.to_DO_LIST_Data.tasks.filter({!$0.checked})
        self.to_DO_LIST_Data.tasks = necessaryTask
    }
    
}

struct TO_DO_LIST_Previews: PreviewProvider {
    static var previews: some View {
        TO_DO_LIST()
            .environmentObject(TO_DO_LIST_Data())
    }
}
