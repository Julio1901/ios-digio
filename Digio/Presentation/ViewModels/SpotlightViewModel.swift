//
//  SpotlightViewModel.swift
//  Digio
//
//  Created by Julio Cesar Pereira on 01/07/24.
//

import Foundation

class SpotlightViewModel {
    var spotlight: Spotlight
    var imageData: Data?
    private var hasError: Bool?
    init(spotlight: Spotlight) {
        self.spotlight = spotlight
    }
    func loadImage(completion: @escaping (_ imageData: Data?) -> Void) {
        if imageData == nil && hasError != true {
            guard let url = URL(string: spotlight.bannerURL) else { return }
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
