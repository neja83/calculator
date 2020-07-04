//
//  ButtonsBoardView.swift
//  Calculator
//
//  Created by Eugene Krapivenko on 02.07.2020.
//  Copyright © 2020 Eugene Krapivenko. All rights reserved.
//

import SwiftUI

struct ButtonsBoardView: View {
    @Binding var number: String
    @Binding var resultOfCalulate: [ResultRow]
    
    @State var action: String = ""
    @State var firstNumber: String = ""
    
    var body: some View {
        VStack(spacing: 10){
            HStack {
                ButtonView(color: .gray, label: "AC", onChange: clearAll)
                ButtonView(color: .blue, label: "%", onChange: action)
                ButtonView(color: .blue, label: "+/-", onChange: togglePlus)
                ButtonView(color: .orange, label: "+", onChange: action)
            }
            HStack {
                ButtonView(
                    color: Color.blue,
                    label: "1",
                    onChange: onChange
                )
                ButtonView(
                    color: Color.blue,
                    label: "2",
                    onChange: onChange
                )
                ButtonView(
                    color: Color.blue,
                    label: "3",
                    onChange: onChange)
                ButtonView(color: .orange, label: "-", onChange: action)
            }
            HStack {
                ButtonView(
                    color: Color.blue,
                    label: "4",
                    onChange: onChange
                )
                ButtonView(
                    color: Color.blue,
                    label: "5",
                    onChange: onChange
                )
                ButtonView(
                    color: Color.blue,
                    label: "6",
                    onChange: onChange
                )
                ButtonView(color: .orange, label: "*", onChange: action)
            }
            HStack {
                ButtonView(
                    color: Color.blue,
                    label: "7",
                    onChange: onChange
                )
                ButtonView(
                    color: Color.blue,
                    label: "8",
                    onChange: onChange
                )
                ButtonView(
                    color: Color.blue,
                    label: "9",
                    onChange: onChange
                )
                ButtonView(color: .orange, label: "/", onChange: action)
            }
            HStack {
                ButtonView(
                    color: Color.blue,
                    label: "00",
                    onChange: onChange
                )
                ButtonView(
                    color: Color.blue,
                    label: "0",
                    onChange: onChange
                )
                ButtonView(
                    color: Color.blue,
                    label: ".",
                    onChange: onChange
                )
                ButtonView(color: .orange, label: "=", onChange: calculateResult )
            }
        }
    }
    
    func onChange(_ value: String) {
        if value.elementsEqual(".") {
            if (self.number.firstIndex(of: ".") != nil){
                return
            }else {
                self.number += "."
                return
            }
        }else if self.number.first == "0" {
            self.number = value
        }else {
            self.number.append(Character(value))
        }
    }
    
    func clearAll(_ value: String){
        self.number = "0"
    }
    
    func action(_ value: String) {
        self.action = value
        self.firstNumber = self.number
        self.number = "0"
    }
    
    func togglePlus(_ value: String) {
        if (self.number.first != "-"){
            self.number = "-" + self.number
        }else {
            self.number = String(self.number.dropFirst())
        }
    }
    
    func calculateResult(_ value: String) {
        let newId = resultOfCalulate.count + 1
        
        let value: Double = self.calculate(
            Double(self.firstNumber) ?? 0.0,
            self.action,
            Double(self.number) ?? 1
            )
        if (!self.number.elementsEqual("0")){
            resultOfCalulate.append(ResultRow(id: newId, value: String(format: "%.6g", value)))
            self.number = "0"
        }
    }
    
    func calculate(_ firstValue: Double, _ action: String, _ secondValue: Double) -> Double {
        switch action {
        case "+": return firstValue + secondValue
        case "*": return firstValue * secondValue
        case "/": return firstValue / secondValue
        case "-": return firstValue - secondValue
        case "%": return firstValue * (secondValue / 100)
        default : return 0.0
        }
    }
}

struct ButtonsBoardView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonsBoardView(
            number: Binding.constant("0"),
            resultOfCalulate: Binding.constant([])
        )
    }
}
