//
//  ProductList.swift
//  Digio
//
//  Created by Julio Cesar Pereira on 01/07/24.
//

import Foundation
import SpotlightsModule

struct ProductsResponse: Codable {
    let spotlight: [Spotlight]
    let products: [Product]
    let cash: Cash
}
