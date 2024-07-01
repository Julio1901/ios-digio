//
//  ProductViewModel.swift
//  Digio
//
//  Created by Julio Cesar Pereira on 01/07/24.
//

import Foundation

class ProductViewModel {
    var product: Product
    var imageData: Data?
    private var hasError: Bool?
    init(product: Product) {
        self.product = product
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
