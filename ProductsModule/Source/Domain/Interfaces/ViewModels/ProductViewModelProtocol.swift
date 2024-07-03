//
//  ProductViewModelProtocol.swift
//  ProductsModule
//
//  Created by Julio Cesar Pereira on 03/07/24.
//

import Foundation

public protocol ProductViewModelProtocol {
    var product: Product { get set }
    var imageData: Data? { get set }
    var hasError: Bool? { get }
    func loadImage(completion: @escaping (_ imageData: Data?) -> Void)
}
