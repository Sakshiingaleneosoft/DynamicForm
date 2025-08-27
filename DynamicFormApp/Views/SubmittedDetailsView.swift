//
//  DisplayView.swift
//
//  Created by Sakshi on 26/08/25.
//

import SwiftUI

struct SubmittedDetailsView: View {
    let fields: [DynamicField]
    let userInputs: [String: String]
    
    var body: some View {
        ZStack {
            ThemeManager.Colors.background.ignoresSafeArea()
            
            VStack {
                // Title
                Text(AppConstants.Title.details)
                    .font(ThemeManager.Fonts.title)
                    .foregroundStyle(Color(ThemeManager.Colors.primary))
                    .padding(.top, 20)
                
                // Scrollable Content
                ScrollView {
                    VStack(spacing: 20) {
                        ForEach(fields) { field in
                            if let value = userInputs[field.title], !value.trimmingCharacters(in: .whitespaces).isEmpty {
                                HStack {
                                    Text("\(field.title):")
                                        .fontWeight(.bold)
                                        .foregroundStyle(Color(ThemeManager.Colors.textPrimary))
                                    
                                    Text(value)
                                        .foregroundStyle(Color(ThemeManager.Colors.textPrimary))
                                }
                            }
                        }
                    }
                    .padding(ThemeManager.Padding.screen)
                }
            }
        }
    }
}

