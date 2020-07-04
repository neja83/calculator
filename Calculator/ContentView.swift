//
//  ContentView.swift
//  Calculator
//

import SwiftUI

struct ContentView: View {
    @State private var resultOfCalulate: [ResultRow] = []
    @State private var number: String = "0"
    @ObservedObject private var settings = UserSettings.instanceOf
    
    var body: some View {
        NavigationView{
            VStack{
                if !resultOfCalulate.isEmpty {
                    ScoreBoardView(resultRows: resultOfCalulate).padding()
                } else { Spacer() }
                ActionBoardView(number: self.number)
                ButtonsBoardView(
                    number: $number,
                    resultOfCalulate: $resultOfCalulate)
            }.padding()
             .navigationBarTitle("Calculator", displayMode: .inline)
             .navigationBarItems(
                trailing: NavigationLink(
                    destination: SettingView(isDark: $settings.isDark)
                          ){ SettingButton() })
        }.environment(\.colorScheme, settings.isDark ? .dark : .light)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
