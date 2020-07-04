//
//  ButtonView.swift
//  Calculator
//
//  Created by Eugene Krapivenko on 30.06.2020.
//  Copyright © 2020 Eugene Krapivenko. All rights reserved.
//

import SwiftUI

struct ButtonView: View {
    let color: Color
    let label: String
    let onChange: (String) -> ()
    
    var body: some View {
        Button(action: {self.onChange(self.label)}){
            Text("\(self.label)")
        }
        .buttonStyle(RectangleButtonStyle(color: color))
    }
}

struct RectangleButtonStyle: ButtonStyle {
    var color: Color
    
    func makeBody(configuration: ButtonStyleConfiguration) -> some View { configuration
        .label
        .font(.system(size: 30))
        .opacity(configuration.isPressed ? 0.5 : 1)
        .foregroundColor(.white)
        .frame(width: 70, height: 70)
        .background(color)
        .cornerRadius(5)
        .scaleEffect(configuration.isPressed ? 0.98 : 1)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(color: Color.orange, label: "22", onChange: { _ in })
    }
}
