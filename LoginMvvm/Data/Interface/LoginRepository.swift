//
//  LoginRepository.swift
//  LoginMvvm
//
//  Created by John Robert Dichoso on 4/8/25.
//

import Foundation

public protocol LoginRepository {
    func login(username: String, password: String, completion: @escaping (Result<User, Error>) -> Void)
}
