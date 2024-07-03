//
//  FetchSpotlightsUseCase.swift
//  Digio
//
//  Created by Julio Cesar Pereira on 02/07/24.
//

import Foundation
import SpotlightsModule

protocol FetchSpotlightsUseCase {
    func execute(completion: @escaping (Result<[Spotlight], Error>) -> Void)
}

class FetchSpotlightsUseCaseImpl: FetchSpotlightsUseCase {
    private let repository: ProductsRepository

    init(repository: ProductsRepository) {
        self.repository = repository
    }

    func execute(completion: @escaping (Result<[Spotlight], Error>) -> Void) {
        repository.fetchItems { result in
            switch result {
            case .success(let response):
                completion(.success(response.spotlight))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
