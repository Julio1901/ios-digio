//
//  MockCashUseCase.swift
//  DigioTests
//
//  Created by Julio Cesar Pereira on 03/07/24.
//

import Foundation
@testable import Digio
@testable import DigioCashModule

class MockCashUseCase: FetchCashUseCase {
    var shouldFail: Bool!
    init(shouldFail: Bool) {
        self.shouldFail = shouldFail
    }
    func execute(completion: @escaping (Result<Cash, Error>) -> Void) {
        let cash = Cash(title: "Cash Title", bannerURL: "https://example.com/banner.jpg", description: "Cash Description")
        if shouldFail {
            let error = NSError(domain: "MockCashUseCase", code: 500, userInfo: [NSLocalizedDescriptionKey: "Failed to fetch digio cash items"])
            completion(.failure(error))
        } else {
            completion(.success(cash))
        }
    }
}
