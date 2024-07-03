//
//  FetchCashUseCase.swift
//  Digio
//
//  Created by Julio Cesar Pereira on 02/07/24.
//

import Foundation
import DigioCashModule

protocol FetchCashUseCase {
    func execute(completion: @escaping (Result<Cash, Error>) -> Void)
}

class FetchCashUseCaseImpl: FetchCashUseCase {
    private let repository: ProductsRepository

    init(repository: ProductsRepository) {
        self.repository = repository
    }

    func execute(completion: @escaping (Result<Cash, Error>) -> Void) {
        repository.fetchItems { result in
            switch result {
            case .success(let response):
                completion(.success(response.cash))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
