//
//  Theme.swift
//
//
import SwiftUI
struct ThemeManager {
    // MARK: - Colors
    struct Colors {
        static let error = Color.red
        static let buttonText = Color.white
        static let primary     = Color.blue.opacity(0.8)     // Soft Blue
        static let accent      = Color.mint.opacity(0.8)     // Fresh Mint
        static let background  = skyMist
        static let textPrimary = Color.black               // Default text
        static let textSecondary = Color.gray
      
        static let skyMist = LinearGradient(
            colors: [
                Color(red: 186/255, green: 230/255, blue: 255/255),
                Color(red: 240/255, green: 246/255, blue: 255/255)
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
    // MARK: - Fonts
    struct Fonts {
        static let title = Font.system(size: 24, weight: .bold)
        static let subtitle = Font.system(size: 16, weight: .regular)
        static let button = Font.system(size: 18, weight: .semibold)
        static let textField = Font.system(size: 16, weight: .regular)
    }
    
    // MARK: - Corner Radius
    struct Radius {
        static let button: CGFloat = 12
        static let field: CGFloat = 10
    }
    
    // MARK: - Padding
    struct Padding {
        static let screen: CGFloat = 16
        static let field: CGFloat = 8
    }
    
    // MARK: - Button 
    static let buttonGradient = LinearGradient(
        colors: [Color.blue, Color.cyan],
        startPoint: .leading,
        endPoint: .trailing
    )
}
