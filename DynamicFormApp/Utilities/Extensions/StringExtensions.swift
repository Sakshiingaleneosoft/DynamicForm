//
//  StringExtensions.swift
//  DynamicFormApp
//
//  Created by Sakshi on 26/08/25.
//
import Foundation

extension String {
    func isValidEmail() -> Bool {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let pred = NSPredicate(format:"SELF MATCHES %@", regex)
        return pred.evaluate(with: self)
    }
    
    func isValidPassword() -> Bool {
        return self.count >= 3
    }
}
