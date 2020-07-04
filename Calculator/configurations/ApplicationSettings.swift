//
//  ApplicationSettings.swift
//  Calculator
//
//  Created by Eugene Krapivenko on 02.07.2020.
//  Copyright © 2020 Eugene Krapivenko. All rights reserved.
//

import Foundation
import Combine

class UserSettings: ObservableObject {
    
    static var instanceOf: UserSettings {
        let instance = UserSettings()
        return instance
    }
    
    @Published var isDark: Bool {
        didSet{
            UserDefaults.standard.set(isDark, forKey: SettingProperty.IS_DARK)
        }
    }

    private init() {
        self.isDark = UserDefaults.standard.object(forKey: SettingProperty.IS_DARK) as? Bool ?? false
    }
    
    public func resetSettings() {
        self.isDark = false
    }
}

extension UserSettings: NSCopying {
    
    func copy(with zone: NSZone? = nil) -> Any {
        return self
    }
}
