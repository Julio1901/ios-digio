//
//  MockFetchImageUseCase.swift
//  DigioTests
//
//  Created by Julio Cesar Pereira on 03/07/24.
//

import Foundation
@testable import Digio

class MockFetchImageUseCase: FetchImageUseCase {
    var shouldFail: Bool
    var mockImageData: Data?
    init(shouldFail: Bool) {
        self.shouldFail = shouldFail
        if let imagePath = Bundle.main.path(forResource: "MockImage", ofType: "png") {
            self.mockImageData = try? Data(contentsOf: URL(fileURLWithPath: imagePath))
        }
    }
    func fetchImage(from imageURL: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        if shouldFail {
            let error = NSError(domain: "MockFetchImageUseCase", code: 500, userInfo: [NSLocalizedDescriptionKey: "Failed to fetch image"])
            completion(.failure(error))
        } else {
            if let data = mockImageData {
                completion(.success(data))
            } else {
                let error = NSError(domain: "MockFetchImageUseCase", code: 404, userInfo: [NSLocalizedDescriptionKey: "Image data not found"])
                completion(.failure(error))
            }
        }
    }
}
