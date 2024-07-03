//
//  MockProductsUseCase.swift
//  DigioTests
//
//  Created by Julio Cesar Pereira on 03/07/24.
//

import Foundation
@testable import Digio
@testable import ProductsModule

class MockProductsUseCase: FetchProductsUseCase {
    var shouldFail: Bool!
    init (shouldFail: Bool) {
        self.shouldFail = shouldFail
    }
    func execute(completion: @escaping (Result<[Product], Error>) -> Void) {
        let products = [
            Product(name: "Product 1", imageURL: "https://example.com/image1.jpg", description: "Description 1"),
            Product(name: "Product 2", imageURL: "https://example.com/image2.jpg", description: "Description 2"),
            Product(name: "Product 3", imageURL: "https://example.com/image3.jpg", description: "Description 3")
        ]
        if shouldFail {
            let error = NSError(domain: "MockProductsUseCase", code: 500, userInfo: [NSLocalizedDescriptionKey: "Failed to fetch products"])
            completion(.failure(error))
        } else {
            completion(.success(products))
        }
    }
}
