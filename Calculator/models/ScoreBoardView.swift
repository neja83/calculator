//
//  Scoreboard.swift
//  Calculator
//
//  Created by Eugene Krapivenko on 30.06.2020.
//  Copyright © 2020 Eugene Krapivenko. All rights reserved.
//

import SwiftUI

struct ScoreBoardView: View {
    var resultRows: [ResultRow]
    
    var body: some View {
        VStack{
            ScrollView(.vertical, showsIndicators: false){
                ForEach(resultRows.reversed()){
                    row in HStack{
                                Spacer()
                        Text("\(row.value)").font(.system(size: 30))
                        }.rotationEffect(.degrees(180))
                }
            }
            .rotationEffect(.degrees(180))
        }
    }
}

struct Scoreboard_Previews: PreviewProvider {
    static var previews: some View {
        ScoreBoardView(resultRows: [
            ResultRow(id: 1, value: "1+2"),
            ResultRow(id: 2, value: "3+4"),
            ResultRow(id: 3, value: "44-22"),
            ResultRow(id: 4, value: "18*33"),
            ResultRow(id: 5, value: "44/11"),
            ]).padding()
    }
}
