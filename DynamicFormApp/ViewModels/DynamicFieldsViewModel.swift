//
//  DynamicFieldsViewModel.swift
//
//  Created by Sakshi on 26/08/25.
//

import Foundation

class DynamicFieldsViewModel: ObservableObject {
    @Published var fields: [DynamicField] = []
    @Published var userInputs: [String: String] = [:]
    @Published var errorMessage: String? = nil
    @Published var fieldErrors: [String: String] = [:]
    
    func fetchFields() {
        guard let url = APIEndpoint.Endpoint.allFields.url else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(AppConstants.Messages.errorFetching + (error.localizedDescription))
                return
            }
            
            guard let data = data else { return }
            
            do {
                let decodedResponse = try JSONDecoder().decode(FieldsResponse.self, from: data)
                DispatchQueue.main.async {
                    self.fields = decodedResponse.fields
                }
            } catch {
                print(AppConstants.Messages.errorDecoding,(error))
            }
        }.resume()
    }
    func shouldValidateBeforeSubmit() -> Bool {
        guard hasAnyFieldFilled() else {
            errorMessage = AppConstants.Messages.emptyFieldError
            return false
        }
        return validateFields()
    }
    
    // Validate fields that are filled
    func validateFields() -> Bool {
        fieldErrors = [:] // reset previous errors
        var isValid = true
        
        for field in fields {
            guard let value = userInputs[field.title], !value.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
                continue // skip empty fields
            }
            
            if let regex = try? NSRegularExpression(pattern: field.regex) {
                let range = NSRange(location: 0, length: value.utf16.count)
                if regex.firstMatch(in: value, options: [], range: range) == nil {
                    fieldErrors[field.title] = "Invalid \(field.title)"
                    isValid = false
                }
            }
        }
        
        // Combine all regex errors into errorMessage for centralized display
        if !fieldErrors.isEmpty {
            errorMessage = fieldErrors.values.joined(separator: "\n")
        } else {
            errorMessage = nil
        }
        
        return isValid
    }
    
    func hasAnyFieldFilled() -> Bool {
        let hasValue = userInputs.values.contains { !$0.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty }
        errorMessage = hasValue ? nil : AppConstants.Messages.emptyFieldError
        return hasValue
    }
}
