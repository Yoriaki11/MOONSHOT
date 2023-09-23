//
//  ContentView.swift
//  MOON SHOT
//
//  Created by 杉本 頼亮 on 2023/09/16.
//

import SwiftUI

struct ContentView: View {
    @State var isShowexplain = false
    @State var isShowWISH_LIST = false
    
    var body: some View {
        NavigationStack {
            ZStack{
                LinearGradient(gradient: Gradient(colors: [.white, .gray]), startPoint: .top, endPoint: .bottom)
                
            VStack {
                Image("moon")
                    .frame(width: 290, height: 290)
                    .clipShape(Circle())
                Text("MOON SHOT")
                    .bold()
                    .font(.largeTitle)
                Button("ムーンショット目標とは？"){
                    isShowexplain = true
                }
                .sheet(isPresented: $isShowexplain) {
                    explain()
                }
                
                HStack{
                    NavigationLink {
                        TO_DO_LIST()
                    }
                     label: {
                        VStack{
                            Image(systemName: "checkmark.shield")
                            Text("TO DO LIST")
                        }
                    }
                    NavigationLink {
                        DREAM_LIST()
                        
                    } label: {
                        VStack{
                            Image(systemName: "trophy")
                            Text("DREAM LIST")
                        }
                    }
                    NavigationLink {
                        HABIT_LIST()
                    } label: {
                        VStack{
                            Image(systemName: "dumbbell")
                            Text("HABIT LIST")
                        }
                    }
                }
                 .padding()
                Text("Good habits are the key to all success.")
                Text("Bad habits are the unlocked door to failure.")
                Text("“失敗者と成功者の間にあるたった一つの違いは「習慣」の違いだ”")
                    .font(.system(size: 10))
                Text("「世界最強の商人　著：オグ・マンディーノ」より抜粋")
                    .font(.system(size: 10))
            }
            }
            .padding()
            
        }
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(TO_DO_LIST_Data())
            .environmentObject(DREAMLISTDATA())
    }
}
