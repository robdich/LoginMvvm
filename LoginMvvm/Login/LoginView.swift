//
//  LoginView.swift
//  LoginMvvm
//
//  Created by John Robert Dichoso on 4/8/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel: LoginViewModel
    
    init(viewModel: LoginViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            Text("Username")
                .frame(maxWidth: .infinity, alignment: .leading)
            TextField("Username", text: $viewModel.username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Text("Password")
                .frame(maxWidth: .infinity, alignment: .leading)
            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: {
                self.viewModel.login()
            }) {
                HStack {
                    Text("Log In")
                        .padding()
                        .foregroundColor(.white)
                    
                    if viewModel.isLoading {
                        ProgressView()
                    }
                }
                .frame(width: 120)
                .frame(minHeight: 50)
                .background(.blue)
                .cornerRadius(100)
            }
            .disabled(viewModel.isLoading)
            
            VStack {
                if let message = viewModel.errorMessage {
                    Text(message)
                        .foregroundColor(.red)
                        .padding()
                }
            }.frame(minHeight: 100)
        }
        .frame(maxWidth: 500)
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    
    class FakeViewModel: LoginViewModel {
        
    }
    
    class FakeRepository: LoginRepository {
        func login(username: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
            
        }
    }
    
    static var previews: some View {
        LoginView(
            viewModel: FakeViewModel(
                loginUseCase: LoginUseCase(
                    repository: FakeRepository()
                )
            )
        )
    }
}
