//
//  DynamicField.swift
//
//  Created by Sakshi on 26/08/25.
//

import Foundation

struct FieldsResponse: Codable {
    let fields: [DynamicField]
}

struct DynamicField: Codable, Identifiable {
    var id: String { title } // unique key
    let type: String
    let regex: String
    let title: String
}
