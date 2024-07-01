//
//  MainViewModel.swift
//  Digio
//
//  Created by Julio Cesar Pereira on 01/07/24.
//

import Foundation

protocol MainViewModelDelegate {
    func test(products : String )
}

class MainViewModel {
    var delegate: MainViewModelDelegate!
    var productsRepository: ProductsRepository!
    
    init(productsRepository: ProductsRepository) {
        self.productsRepository = productsRepository
    }
   
    func fetchItems() {
        productsRepository.fetchItems { [weak self] result in
            switch result {
            case .success(let productList):
//                self?.spotlights = productList.spotlight
//                self?.products = productList.products
//                self?.cash = productList.cash
                self?.delegate.test(products: "\(productList)" )
            case .failure(let error):
//                self?.errorMessage = error.localizedDescription
                self?.delegate.test(products: "Falha na chamada" )
            }
        }
    }
}
