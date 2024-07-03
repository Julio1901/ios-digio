//
//  MockSpotlightsUseCase.swift
//  DigioTests
//
//  Created by Julio Cesar Pereira on 03/07/24.
//

import Foundation
@testable import Digio
@testable import SpotlightsModule

class MockSpotlightsUseCase: FetchSpotlightsUseCase {
    var shouldFail: Bool!
    init (shouldFail: Bool) {
        self.shouldFail = shouldFail
    }
    func execute(completion: @escaping (Result<[Spotlight], Error>) -> Void) {
        let spotlights = [
            Spotlight(name: "Spotlight 1", bannerURL: "https://example.com/banner1.jpg", description: "Description 1"),
            Spotlight(name: "Spotlight 2", bannerURL: "https://example.com/banner2.jpg", description: "Description 2")
        ]
        if shouldFail {
            let error = NSError(domain: "MockSpotlightsUseCase", code: 500, userInfo: [NSLocalizedDescriptionKey: "Failed to fetch spotlights"])
            completion(.failure(error))
        } else {
            completion(.success(spotlights))
        }
    }
}
