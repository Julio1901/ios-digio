//
//  ImageRepositoryImpl.swift
//  Digio
//
//  Created by Julio Cesar Pereira on 03/07/24.
//

import Foundation

class ImageRepositoryImpl: ImageRepository {
    private let apiClient: APIClientProtocol
    init(apiClient: APIClientProtocol) {
        self.apiClient = apiClient
    }
    func fetchImage(from imageURL: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        apiClient.fetchImageData(from: imageURL) { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
