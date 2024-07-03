//
//  DigioCashViewModel.swift
//  Digio
//
//  Created by Julio Cesar Pereira on 01/07/24.
//

import Foundation
import DigioCashModule

class DigioCashViewModel: DigioCashDetailViewModelProtocol {
    var digioCash: Cash
    var imageData: Data?
    internal var hasError: Bool?

    private let fetchImageUseCase: FetchImageUseCase

    init(digioCash: Cash, fetchImageUseCase: FetchImageUseCase) {
        self.digioCash = digioCash
        self.fetchImageUseCase = fetchImageUseCase
    }
    func loadImage(completion: @escaping (_ imageData: Data?) -> Void) {
        guard let url = URL(string: digioCash.bannerURL) else {
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
