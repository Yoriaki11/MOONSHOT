//
//  explain.swift
//  MOON SHOT
//
//  Created by 杉本 頼亮 on 2023/09/17.
//

import SwiftUI

struct explain: View {
    var body: some View {
        VStack(spacing: 0){
            Rectangle()
                .fill(Color.gray)
                .opacity(0.45)
                .ignoresSafeArea()
            
            ZStack{
                Image("astronaut")
                    .resizable()
                    .scaledToFill()
                    .opacity(0.2)
                    
                VStack{
                    Text("ムーンショット目標とは")
                        .font(.title)
                        .fontWeight(.bold)
                    Text("「ムーンショット（Moon Shot）」")
                        .padding()
                        .font(.title2)
                        .fontWeight(.bold)
                    Text("前人未踏で非常に困難だが、達成できれば大きなインパクトをもたらし、イノベーションを生む壮大な計画や挑戦のこと。")
                        .padding()
                    Text("「ムーンショット目標」とも呼ばれ、本来は月に向かってロケットを打ち上げることを指します。")
                        .padding()
                    Text("「バックキャスティング思考」")
                        .padding()
                        .font(.title2)
                        .fontWeight(.bold)
                    Text("最初に目標とする未来像を描き、次にその未来像を実現するための道筋を未来から現在へとさかのぼって記述する。")
                        .padding()
                }
            }
            Rectangle()
                .fill(Color.gray)
                .opacity(0.45)
                .ignoresSafeArea()
                
        }
    }
}

struct explain_Previews: PreviewProvider {
    static var previews: some View {
        explain()
    }
}
