//
//  TO DO LIST Row.swift
//  MOON SHOT
//
//  Created by 杉本 頼亮 on 2023/09/18.
//

import SwiftUI

struct TO_DO_LIST_Row: View {
    let task: String
    var isCheck: Bool
    
    var body: some View {
        HStack {
            if isCheck{
                Text("☑︎")
                Text(task)
                    .strikethrough()
                    .fontWeight(.ultraLight)
            } else {
                Text("□")
                Text(task)
            }

        }
    }
}

struct TO_DO_LIST_Row_Previews: PreviewProvider {
    static var previews: some View {
        TO_DO_LIST_Row(task:"料理", isCheck: true)
    }
}
