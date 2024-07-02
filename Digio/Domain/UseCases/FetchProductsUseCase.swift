//
//  FetchProductsUseCase.swift
//  Digio
//
//  Created by Julio Cesar Pereira on 02/07/24.
//

import Foundation

protocol FetchProductsUseCase {
    func execute(completion: @escaping (Result<[Product], Error>) -> Void)
}

class FetchProductsUseCaseImpl: FetchProductsUseCase {
    private let repository: ProductsRepository

    init(repository: ProductsRepository) {
        self.repository = repository
    }

    func execute(completion: @escaping (Result<[Product], Error>) -> Void) {
        repository.fetchItems { result in
            switch result {
            case .success(let response):
                completion(.success(response.products))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
