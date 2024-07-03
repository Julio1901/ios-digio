//
//  ProductViewModel.swift
//  Digio
//
//  Created by Julio Cesar Pereira on 01/07/24.
//

import Foundation
import ProductsModule

class ProductViewModel: ProductViewModelProtocol {
    var product: Product
    var imageData: Data?
    internal var hasError: Bool?
    init(product: Product) {
        self.product = product
    }
    func loadImage(completion: @escaping (_ imageData: Data?) -> Void) {
        if imageData == nil && hasError != true {
            guard let url = URL(string: product.imageURL) else { return }
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
