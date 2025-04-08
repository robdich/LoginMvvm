//
//  LoginManager.swift
//  LoginMvvm
//
//  Created by John Robert Dichoso on 4/9/25.
//

import Foundation
class LoginManager : ObservableObject {
    @Published var loggedinUser: User? = nil
    
    func setUser(user: User) {
        self.loggedinUser = user
    }
    
    func deleteUser() {
        self.loggedinUser = nil
    }
}
