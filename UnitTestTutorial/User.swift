//
//  User.swift
//  UnitTestTutorialUITests
//
//  Created by Doğancan Mavideniz on 16.06.2022.
//

import Foundation
import Combine

class User: ObservableObject {
    @Published var isLoggedIn = false
    @Published var username = ""
    @Published var password = ""
 
    func login() -> Bool {
        guard username == "test" && password == "pass" else {
            return false
        }
 
        password = ""
        isLoggedIn = true
        return true
    }
    
    func logout() {
            isLoggedIn = false
            username = ""
        }
}
