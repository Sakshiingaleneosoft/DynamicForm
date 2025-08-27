//
//  APIService.swift
//
//  Created by Sakshi on 26/08/25.
//

import Foundation

class APIService {
    static let shared = APIService()
    
    func fetchDynamicFields(completion: @escaping (Result<[DynamicField], Error>) -> Void) {
        guard let url = APIEndpoint.Endpoint.allFields.url else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let data = data {
                do {
                    let fields = try JSONDecoder().decode([DynamicField].self, from: data)
                    completion(.success(fields))
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
