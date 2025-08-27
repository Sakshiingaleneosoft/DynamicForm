//
//  LoginView.swift
//
//  Created by Sakshi on 26/08/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var loginViewModel = LoginViewModel()
    @State private var isNavigatingToDynamicFieldsView = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                ThemeManager.Colors.background.ignoresSafeArea()
                ScrollView {
                    VStack(spacing: 24) {
                        
                        // MARK: - App Title
                        Text(AppConstants.Title.welcome)
                            .font(ThemeManager.Fonts.title)
                            .foregroundColor(ThemeManager.Colors.textPrimary)
                        Image(AppConstants.Constants.login)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 140, height: 140)
                        Text(AppConstants.Title.login)
                            .font(ThemeManager.Fonts.title)
                            .foregroundColor(ThemeManager.Colors.primary)
                        
                        // MARK: - Email
                        VStack(alignment: .leading, spacing: 5) {
                            
                            CustomTextField(
                                label: AppConstants.Constants.email,
                                placeholder: AppConstants.Placeholders.email,
                                text: $loginViewModel.email,
                                keyboardType: .emailAddress
                            )
                        }
                        
                        // MARK: - Password
                        VStack(alignment: .leading, spacing: 5) {
                            CustomTextField(
                                label: AppConstants.Constants.password,
                                placeholder: AppConstants.Placeholders.password,
                                text: $loginViewModel.password,
                                isSecure: true
                            )
                        }
                        
                        // MARK: - Login Button
                        CustomButton(title: AppConstants.Buttons.login) {
                            loginViewModel.validateLogin()
                            if loginViewModel.isLoggedIn {
                                isNavigatingToDynamicFieldsView = true
                            }
                        }
                        // MARK: - Error Message
                        if let error = loginViewModel.errorMessage {
                            Text(error)
                                .foregroundColor(ThemeManager.Colors.error)
                                .font(.caption)
                                .padding(.top, 8)
                        }
                        Spacer()
                    }
                    .padding(ThemeManager.Padding.screen)
                    // MARK: - Navigation
                    .navigationDestination(isPresented: $isNavigatingToDynamicFieldsView) {
                        DynamicFieldsView()
                    }
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
