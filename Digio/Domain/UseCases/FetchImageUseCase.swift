//
//  FetchImageUseCase.swift
//  Digio
//
//  Created by Julio Cesar Pereira on 03/07/24.
//

import Foundation

protocol FetchImageUseCase {
    func fetchImage(from imageURL: URL, completion: @escaping (Result<Data, Error>) -> Void)
}

class FetchImageUseCaseImpl: FetchImageUseCase {
    private let imageRepository: ImageRepository
    init(imageRepository: ImageRepository) {
        self.imageRepository = imageRepository
    }
    func fetchImage(from imageURL: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        imageRepository.fetchImage(from: imageURL) { result in
            switch result {
            case .success(let imageData):
                completion(.success(imageData))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
