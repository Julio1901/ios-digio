//
//  MainViewModel.swift
//  Digio
//
//  Created by Julio Cesar Pereira on 01/07/24.
//

import Foundation

protocol MainViewModelDelegate {
    func didFetchProducts()
}

class MainViewModel {
    var delegate: MainViewModelDelegate!
    var productsRepository: ProductsRepository!
    var productsResponse: ProductsResponse?
    
    init(productsRepository: ProductsRepository) {
        self.productsRepository = productsRepository
    }
    func fetchItems() {
        productsRepository.fetchItems { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.productsResponse = response
                delegate.didFetchProducts()
//                self.delegate?.test(products: "Dados recebidos com sucesso")
            case .failure(let error):
                print("Erro ao buscar dados: \(error.localizedDescription)")
                delegate.didFetchProducts()
//                self.delegate?.test(products: "Falha na chamada")
            }
        }
    }
}
