//
//  CustomTextField.swift
//
//  Created by Sakshi on 26/08/25.
//

import SwiftUI

struct CustomTextField: View {
    let label: String
    let placeholder: String
    @Binding var text: String
    var isSecure: Bool = false
    var keyboardType: UIKeyboardType = .default
    @State private var isPasswordVisible: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(label)
                .font(ThemeManager.Fonts.textField)
                .foregroundColor(ThemeManager.Colors.textPrimary)
                .bold()
            
            ZStack(alignment: .leading) {
                // Custom Placeholder
                if text.isEmpty {
                    Text(placeholder)
                        .foregroundColor(ThemeManager.Colors.textSecondary)
                        .padding(.leading, 8)
                }
                
                HStack {
                    if isSecure {
                        if isPasswordVisible {
                            TextField("", text: $text)
                                .padding(ThemeManager.Padding.field)
                                .keyboardType(keyboardType)
                                .autocapitalization(.none)
                        } else {
                            SecureField("", text: $text)
                                .padding(ThemeManager.Padding.field)
                                .keyboardType(keyboardType)
                                .autocapitalization(.none)
                        }
                        
                        // Eye button
                        Button(action: {
                            isPasswordVisible.toggle()
                        }) {
                            Image(systemName: isPasswordVisible ? AppConstants.Constants.eyeSlashFill : AppConstants.Constants.eyeFill)
                                .foregroundColor(ThemeManager.Colors.textSecondary)
                        }
                        .padding(.trailing, 8)
                        
                    } else {
                        TextField("", text: $text)
                            .padding(ThemeManager.Padding.field)
                            .keyboardType(keyboardType)
                            .autocapitalization(.none)
                    }
                }
            }
            .foregroundColor(ThemeManager.Colors.textPrimary)
            .background(ThemeManager.Colors.background)
            .cornerRadius(ThemeManager.Radius.field)
            .shadow(radius: 2)
        }
    }
}

