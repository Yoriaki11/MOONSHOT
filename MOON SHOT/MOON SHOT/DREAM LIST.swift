//
//  DREAM LIST.swift
//  MOON SHOT
//
//  Created by 杉本 頼亮 on 2023/09/17.
//

import SwiftUI



struct DREAM_LIST: View {
    @EnvironmentObject var dREAMLISTDATA:DREAMLISTDATA
    
    var body: some View {
            NavigationView{
                List{
                    ForEach(dREAMLISTDATA.tasks){task in
                        Button(action: {
                            guard let index = self.dREAMLISTDATA.tasks.firstIndex(of: task)else{
                                return
                            }
                            
                            self.dREAMLISTDATA.tasks[index].checked.toggle()
                        })
                        {
                            DREAMLISTROW(task: task.title, isCheck: task.checked)
                        }
                        
                    }
                    
                    if self.dREAMLISTDATA.isEditing{
                        DREAMLISTDRAFT()
                    }
                    else{
                        Button(action: {
                            self.dREAMLISTDATA.isEditing = true
                        })
                        {
                            Text("＋")
                                .font(.title)
                        }
                    }
                }
                        .navigationTitle(Text("DREAM LIST"))
                        .navigationBarItems(trailing: Button(action: {
                            DeleteTask()
                        })
                    {
                            Text("Delete")
                            
                        }
                        )
                }
            }
            
            func DeleteTask() {
                let necessaryTask = self.dREAMLISTDATA.tasks.filter({!$0.checked})
                self.dREAMLISTDATA.tasks = necessaryTask
            }
        }
        
        struct DREAM_LIST_Previews: PreviewProvider {
            static var previews: some View {
                DREAM_LIST()
                    .environmentObject(DREAMLISTDATA())
            }
        }
