//
//  APIEndPoints.swift
//  DynamicFormApp
//
//  Created by Sakshi on 26/08/25.
//
import Foundation

struct APIEndpoint {
    static let baseURL = "https://dummyjson.com"
    
    enum Endpoint: String {
        case allFields = "/c/ecba-d817-4ee0-8d3e"
        case threeFields = "/c/6dec-bc01-4978-83a8" // Currently, we have been using the allFields API endpoint. If you’d like to test with just three fields, please use this endpoint instead. 
        
        var url: URL? {
            return URL(string: APIEndpoint.baseURL + self.rawValue)
        }
    }
}

