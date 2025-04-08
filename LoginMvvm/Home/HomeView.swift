//
//  HomeView.swift
//  LoginMvvm
//
//  Created by John Robert Dichoso on 4/9/25.
//

import SwiftUI

struct HomeView: View {
    
    private let loginManager: LoginManager
    
    init(loginManager: LoginManager) {
        self.loginManager = loginManager
    }
    
    var body: some View {
        VStack {
            Text("Welcome, \(getName())!")
                .font(.largeTitle)
                .padding()
            
            Button(action: {
                self.loginManager.deleteUser()
            }) {
                Text("Log Out")
                    .padding()
                    .foregroundColor(.white)
                    .frame(width: 120)
                    .frame(minHeight: 50)
                    .background(.blue)
                    .cornerRadius(100)
            }
        }
        .onDisappear {
            self.loginManager.deleteUser()
        }
    }
    
    private func getName() -> String {
        if let name = self.loginManager.loggedinUser?.firstName {
            return name
        } else {
            return "User"
        }
    }
}
