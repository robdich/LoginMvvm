//
//  LoginViewModel.swift
//  LoginMvvm
//
//  Created by John Robert Dichoso on 4/8/25.
//

import Foundation

public class LoginViewModel: ObservableObject {
    
    private let loginUseCase: LoginUseCase
    
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var user: User?
    @Published var isLoading: Bool = false
    @Published var isLoggedIn: Bool = false
    @Published var errorMessage: String?
    
    public init(loginUseCase: LoginUseCase) {
        self.loginUseCase = loginUseCase
    }
    
    public func login() {
        self.isLoading = true
        self.errorMessage = nil
        
        self.loginUseCase.execute(username: self.username, password: self.password) { [weak self] result in
            self?.isLoading = false
            switch result {
            case .success(let user):
                DispatchQueue.main.async {
                    self?.user = user
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
