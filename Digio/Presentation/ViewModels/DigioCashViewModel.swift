//
//  DigioCashViewModel.swift
//  Digio
//
//  Created by Julio Cesar Pereira on 01/07/24.
//

import Foundation

class DigioCashViewModel {
    var digioCash: Cash
    var imageData: Data?
    private var hasError: Bool?
    init(digioCash: Cash) {
        self.digioCash = digioCash
    }
    func loadImage(completion: @escaping (_ imageData: Data?) -> Void) {
        if imageData == nil && hasError != true {
            guard let url = URL(string: digioCash.bannerURL) else { return }
            URLSession.shared.dataTask(with: url) { (data, _, error) in
                if error != nil {
                    self.hasError = true
                    completion(nil)
                    return
                }
                guard let data = data else {
                    self.hasError = true
                    completion(nil)
                    return
                }
                self.imageData = data
                self.hasError = false
                completion(data)
            }.resume()
        }
    }
}
