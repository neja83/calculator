//
//  SettingButton.swift
//  Calculator
//
//  Created by Eugene Krapivenko on 02.07.2020.
//  Copyright © 2020 Eugene Krapivenko. All rights reserved.
//

import SwiftUI

struct SettingButton: View {
    var body: some View {
        Image(systemName: "slider.horizontal.3")
            .foregroundColor(Color.blue)
            .font(.system(size: 25))
    }
}

struct SettingButton_Previews: PreviewProvider {
    static var previews: some View {
        SettingButton()
    }
}
