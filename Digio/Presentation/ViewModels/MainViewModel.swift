//
//  MainViewModel.swift
//  Digio
//
//  Created by Julio Cesar Pereira on 01/07/24.
//

import Foundation
import os.log

protocol MainViewModelDelegate: AnyObject {
    func didFetchProducts()
}

class MainViewModel {
    var delegate: MainViewModelDelegate!
    var productsRepository: ProductsRepository!
    var productsResponse: ProductsResponse?
    var productViewModelList: [ProductViewModel] = []
    var spotlightViewModelList: [SpotlightViewModel] = []
    var digioCashViewModelList: [DigioCashViewModel] = []
    private let logger = LoggerFactory.makeLogger(category: "network")
    init(productsRepository: ProductsRepository) {
        self.productsRepository = productsRepository
    }
    func fetchItems() {
        productsRepository.fetchItems { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.productsResponse = response
                populateProductViewModelList(products: response.products)
                populateSpotlightViewModelList(spotlights: response.spotlight)
                populateDigioCashViewModelList(cashList: createCashList(from: response.cash))
                delegate.didFetchProducts()
            case .failure(let error):
                LoggerFactory.logErrorMessage(error.localizedDescription, logger: self.logger)
                delegate.didFetchProducts()
            }
        }
    }
    private func populateProductViewModelList(products: [Product]) {
        for product in products {
            productViewModelList.append(ProductViewModel(product: product))
        }
    }
    private func populateSpotlightViewModelList(spotlights: [Spotlight]) {
        for spotlight in spotlights {
            spotlightViewModelList.append(SpotlightViewModel(spotlight: spotlight))
        }
    }
    private func populateDigioCashViewModelList(cashList: [Cash]) {
        for cash in cashList {
            digioCashViewModelList.append(DigioCashViewModel(digioCash: cash))
        }
    }
    private func createCashList(from cash: Cash) -> [Cash] {
        return [cash]
    }
}
