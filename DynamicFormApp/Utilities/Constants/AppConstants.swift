//
//  AppConstants.swift
//
//  Created by Sakshi on 26/08/25.
//

import Foundation

struct AppConstants {
    
    struct Placeholders {
        static let email = "Enter your email"
        static let password = "Enter your password"
        
    }
    struct Title {
        static let login = "Login to continue"
        static let welcome = "Welcome Back 👋"
        static let fillDetails = "Fill Your Details ✍️"
        static let details = "Your Details"
    }
    
    struct Buttons {
        static let login = "Login"
        static let submit = "Submit"
    }
    
    struct Messages {
        static let invalidEmail = "Please enter a valid email address."
        static let invalidPassword = "Password must be at least 3 characters long."
        static let errorFetching = "Error fetching fields: "
        static let errorDecoding = "Error decoding fields: "
        static let emptyFieldError = "Please fill at least one field before submitting."
    }
    
    struct Constants {
        static let done = "Done"
        static let login = "Login"
        static let email = "Email"
        static let password = "Password"
        static let eyeSlashFill = "eye.slash.fill"
        static let eyeFill = "eye.fill"
    }
}
