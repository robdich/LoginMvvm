//
//  DefaultLoginRepository.swift
//  LoginMvvm
//
//  Created by John Robert Dichoso on 4/8/25.
//

import Foundation

public class DefaultLoginRepository: LoginRepository {
    
    private let dataSource: LoginDataSource
    
    public init(dataSource: LoginDataSource) {
        self.dataSource = dataSource
    }
    
    public func login(username: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        self.dataSource.login(username: username, password: password, completion: completion)
    }
}
