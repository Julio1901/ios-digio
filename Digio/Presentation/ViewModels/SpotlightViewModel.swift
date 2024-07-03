//
//  SpotlightViewModel.swift
//  Digio
//
//  Created by Julio Cesar Pereira on 01/07/24.
//

import Foundation
import SpotlightsModule

class SpotlightViewModel: SpotlightsDetailViewModelProtocol {
    var spotlight: Spotlight
    var imageData: Data?
    internal var hasError: Bool?

    private let fetchImageUseCase: FetchImageUseCase

    init(spotlight: Spotlight, fetchImageUseCase: FetchImageUseCase) {
        self.spotlight = spotlight
        self.fetchImageUseCase = fetchImageUseCase
    }

    func loadImage(completion: @escaping (_ imageData: Data?) -> Void) {
        guard let url = URL(string: spotlight.bannerURL) else {
            self.hasError = true
            completion(nil)
            return
        }
        fetchImageUseCase.fetchImage(from: url) { [weak self] result in
            switch result {
            case .success(let data):
                self?.imageData = data
                self?.hasError = false
                completion(data)
            case .failure:
                self?.hasError = true
                completion(nil)
            }
        }
    }
}
