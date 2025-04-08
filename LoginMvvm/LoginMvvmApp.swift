//
//  LoginMvvmApp.swift
//  LoginMvvm
//
//  Created by John Robert Dichoso on 4/8/25.
//

import SwiftUI

@main
struct LoginMvvmApp: App {
    var body: some Scene {
        WindowGroup {
            //Dependency Injection
            let loginManager = LoginManager()
            let loginDataSource = RemoteLoginDataSource(loginManager: loginManager)
            let loginRepository = DefaultLoginRepository(dataSource: loginDataSource)
            let loginUseCase = LoginUseCase(repository: loginRepository)
            let loginViewModel = LoginViewModel(loginUseCase: loginUseCase)
            let loginView = LoginView(viewModel: loginViewModel)
            let homeView = HomeView(loginManager: loginManager)
            ContentView(loginView: loginView, homeView: homeView, loginManager: loginManager)
        }
    }
}
