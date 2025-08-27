//
//  CustomButton.swift
//
//  Created by Sakshi on 26/08/25.
//
import SwiftUI

struct CustomButton: View {
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .fontWeight(.bold)
                .padding()
                .foregroundColor(ThemeManager.Colors.buttonText)
                .background(LinearGradient(
                    colors: [ThemeManager.Colors.primary, ThemeManager.Colors.accent],
                    startPoint: .leading,
                    endPoint: .trailing
                ))
                .cornerRadius(ThemeManager.Radius.button)
                .shadow(color: ThemeManager.Colors.primary.opacity(0.3), radius: 5, x: 0, y: 3)
        }
        .padding(.horizontal, 8)
    }
}

