//
//  DynamicFieldsView.swift
//
//  Created by Sakshi on 26/08/25.
//
import SwiftUI

struct DynamicFieldsView: View {
    @StateObject private var formViewModel = DynamicFieldsViewModel()
    @State private var isNavigateToDetailView = false
    @FocusState private var focusedField: String?   // track active field by title
    
    var body: some View {
        ZStack {
            ThemeManager.Colors.background.ignoresSafeArea()
            // Title
            VStack(spacing: 20) {
                Text(AppConstants.Title.fillDetails)
                    .font(ThemeManager.Fonts.title)
                    .foregroundColor(ThemeManager.Colors.primary)
                
                List(formViewModel.fields) { field in
                    CustomTextField(
                        label: field.title,
                        placeholder: "Enter \(field.title)",
                        text: Binding(
                            get: { formViewModel.userInputs[field.title] ?? "" },
                            set: { formViewModel.userInputs[field.title] = $0 }
                        ),
                        keyboardType: keyboardTypeFor(field.type)
                    )
                    .listRowBackground(Color.clear)
                    .focused($focusedField, equals: field.title)  // track focus
                }
                .scrollContentBackground(.hidden)
                .listStyle(.plain)
                
                //MARK: - Submit Button
                CustomButton(title: AppConstants.Buttons.submit) {
                    if formViewModel.shouldValidateBeforeSubmit() {
                        isNavigateToDetailView = true
                    }
                }
                //MARK: - Error Message
                if let error = formViewModel.errorMessage {
                    Text(error)
                        .foregroundColor(ThemeManager.Colors.error)
                        .font(.caption)
                        .padding(.top, 4)
                }
            }
            .padding(ThemeManager.Padding.screen)
        }
        .onAppear { formViewModel.fetchFields()}
        
        // MARK: - Navigation
        .navigationDestination(isPresented: $isNavigateToDetailView) {
            SubmittedDetailsView(fields: formViewModel.fields, userInputs: formViewModel.userInputs)
        }
        
        //  toolbar only shows for numeric/phone fields
        .toolbar {
            if let field = focusedField {
                let type = keyboardTypeFor(formViewModel.fields.first(where: { $0.title == field })?.type ?? "")
                if type == .numberPad || type == .phonePad {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button(AppConstants.Constants.done) {
                            focusedField = nil // dismiss
                        }
                    }
                }
            }
        }
    }
    //MARK: - Keyboards Types
    func keyboardTypeFor(_ fieldType: String) -> UIKeyboardType {
        switch fieldType.lowercased().trimmingCharacters(in: .whitespacesAndNewlines) {
        case "email":
            return .emailAddress
        case "mobile", "phone":
            return .phonePad
        case "number":
            return .numberPad
        default:
            return .default
        }
    }
}

#Preview {
    DynamicFieldsView()
}
