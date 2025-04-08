//
//  ContentView.swift
//  LoginMvvm
//
//  Created by John Robert Dichoso on 4/8/25.
//

import SwiftUI

struct ContentView: View {
    
    private let loginView: LoginView
    private let homeView: HomeView
    
    @StateObject private var loginManager: LoginManager
    
    init(loginView: LoginView,
         homeView: HomeView,
         loginManager: LoginManager) {
        self.loginView = loginView
        self.homeView = homeView
        _loginManager = StateObject(wrappedValue: loginManager)
    }
    
    var body: some View {
        VStack {
            if loginManager.loggedinUser != nil {
                self.homeView
            } else {
                self.loginView
            }
        }
    }
}
