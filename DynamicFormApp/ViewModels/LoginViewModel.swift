//
//  LoginViewModel.swift
//
//  Created by Sakshi on 26/08/25.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String?
    @Published var isLoggedIn: Bool = false
    @Published var isValid = false
    
    func validateLogin() {
        if email.isValidEmail(){
            if password.isValidPassword() {
                errorMessage = nil
                isLoggedIn = true
            } else {
                errorMessage = AppConstants.Messages.invalidPassword
            }
        } else {
            errorMessage = AppConstants.Messages.invalidEmail
        }
    }
}

