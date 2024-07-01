//
//  ProductsRepositoryImpl.swift
//  Digio
//
//  Created by Julio Cesar Pereira on 30/06/24.
//

import Foundation

class ProductsRepositoryImpl: ProductsRepository {
    private let apiClient: APIClientProtocol
    init(apiClient: APIClientProtocol) {
       self.apiClient = apiClient
    }
    func fetchItems(completion: @escaping (Result<ProductsResponse, Error>) -> Void) {
        apiClient.fetchItems { result in
            switch result {
            case .success(let data):
                do {
                    let productList = try JSONDecoder().decode(ProductsResponse.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(productList))
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion(.failure(ApiError.decodingError))
                    }
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
}
