//
//  SettingView.swift
//  Calculator
//
//  Created by Eugene Krapivenko on 01.07.2020.
//  Copyright © 2020 Eugene Krapivenko. All rights reserved.
//

import SwiftUI

struct SettingView: View {
    @Binding var isDark: Bool
    @State private var settings = UserSettings.instanceOf
    
    var body: some View {
        Form{
            Section{
                Toggle(isOn: $isDark){
                    Text("Темная тема")
                }
            }
            
            Section{
                Button(action: resetSettings){
                    Text("Сбросить настройки")
                }
            }
        }
    }
    
    func resetSettings() {
        isDark = false
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView(isDark: Binding.constant(false))
    }
}
