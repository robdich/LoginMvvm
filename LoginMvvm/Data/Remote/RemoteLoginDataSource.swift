//
//  RemoteLoginDataSource.swift
//  LoginMvvm
//
//  Created by John Robert Dichoso on 4/8/25.
//

import Foundation

public class RemoteLoginDataSource: LoginDataSource {
    
    private let loginManager: LoginManager
    
    init(loginManager: LoginManager) {
        self.loginManager = loginManager
    }
    
    private let correctUsername = "JohnSmith"
    private let correctPassword = "abc123"
    private let user = User(firstName: "John", lastName: "Smith")
    
    public func login(username: String,
                      password: String,
                      completion: @escaping (Result<User, Error>) -> Void
    ) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            if username != self.correctUsername || password != self.correctPassword {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Login Error"])))
                return
            }
            
            self.loginManager.setUser(user: self.user)
            completion(.success(self.user))
        }
    }
}
