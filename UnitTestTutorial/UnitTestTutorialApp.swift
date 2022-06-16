//
//  UnitTestTutorialApp.swift
//  UnitTestTutorial
//
//  Created by Doğancan Mavideniz on 16.06.2022.
//

import SwiftUI

@main
struct UnitTestTutorialApp: App {
    
    var user = User()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(user)
        }
    }
}
