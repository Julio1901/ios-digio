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
    private var hasError : Bool?
    
    init(spotlight: Spotlight){
        self.spotlight = spotlight
    }
    
    func loadImage(from stringUrl: String, completion: @escaping (_ imageData: Data?) -> Void) async {
        if (imageData == nil && hasError != true) {
            guard let url = URL(string: stringUrl) else {return}
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    self.hasError = true
                    return
                }
                guard let data = data else {
                    self.hasError = true
                    return
                }
                self.imageData = data
                completion(data)
                self.hasError = false
            }.resume()
        }
    }
}
