//
//  DREAM LIST.swift
//  MOON SHOT
//
//  Created by 杉本 頼亮 on 2023/09/17.
//

import SwiftUI
import CoreData

struct DREAM_LIST: View {
    @EnvironmentObject var dREAMLISTDATA:DREAMLISTDATA
    
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(sortDescriptors: [])
    var tasks: FetchedResults<Dream>
    
    var body: some View {
            NavigationView{
                List{
                    ForEach(tasks){task in
                        Button(action: {
                            task.checked.toggle()
                        })
                        {if((task.title?.isEmpty) == false){
                            DREAMLISTROW(task: task.title!, isCheck: task.checked)
                        }
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
        
        struct DREAM_LIST_Previews: PreviewProvider {
            static var previews: some View {
                DREAM_LIST()
                    .environmentObject(DREAMLISTDATA())
            }
        }
