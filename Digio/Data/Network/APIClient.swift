//
//  APIClient.swift
//  Digio
//
//  Created by Julio Cesar Pereira on 30/06/24.
//

import Foundation

class APIClient : APIClientProtocol {

    func fetchItems(completion: @escaping (Result<Data, any Error>) -> Void) {
        guard let endpoint = URL(string: APIEndpoints.Products.fetch) else {
        completion(.failure(ApiError.invalidURL))
        return
        }
        URLSession.shared.dataTask(with: endpoint) { data, response, error in
            if let error = error {
                completion(.failure(ApiError.sessionError(error)))
                return
            }
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(.failure(ApiError.invalidResponse))
                return
            }
            guard let data = data else {
                completion(.failure(ApiError.noData))
                return
            }
            completion(.success(data))
        }.resume()
    }
}
