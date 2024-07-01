//
//  ProductsRepository.swift
//  Digio
//
//  Created by Julio Cesar Pereira on 30/06/24.
//

import Foundation

protocol ProductsRepository {
    func fetchItems(completion: @escaping (Result<ProductList, Error>) -> Void)
}
