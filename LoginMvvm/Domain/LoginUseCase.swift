//
//  LoginUseCase.swift
//  LoginMvvm
//
//  Created by John Robert Dichoso on 4/9/25.
//

import Foundation

public class LoginUseCase {
    private let repository: LoginRepository
    
    public init(repository: LoginRepository) {
        self.repository = repository
    }
    
    public func execute(username: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        self.repository.login(username: username, password: password, completion: completion)
    }
}
