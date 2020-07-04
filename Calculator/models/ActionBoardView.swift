//
//  ActionBoardView.swift
//  Calculator
//
//  Created by Eugene Krapivenko on 04.07.2020.
//  Copyright © 2020 Eugene Krapivenko. All rights reserved.
//

import SwiftUI

struct ActionBoardView: View {
    var number: String
    var body: some View {
        HStack{
            Spacer()
            Text("\(self.number)")
                .font(.system(size: 35))
                .padding(20)
        }
    }
}

struct ActionBoardView_Previews: PreviewProvider {
    static var previews: some View {
        ActionBoardView(number: "0")
    }
}
