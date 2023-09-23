//
//  DREAMLISTROW.swift
//  MOON SHOT
//
//  Created by 杉本 頼亮 on 2023/09/23.
//

import SwiftUI

struct DREAMLISTROW: View {
    let task: String
    var isCheck: Bool
    
    var body: some View {
            HStack {
                if isCheck{
                    Text("☑︎")
                    Text(task)
                        .strikethrough()
                        .fontWeight(.ultraLight)
                }else{
                    Text("□")
                    Text(task)
                }
                
            }
    }
}

struct DREAMLISTROW_Previews: PreviewProvider {
    static var previews: some View {
        DREAMLISTROW(task: "料理",isCheck:true)
    }
}
