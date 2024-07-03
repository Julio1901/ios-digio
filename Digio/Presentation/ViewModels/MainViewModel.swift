//
//  MainViewModel.swift
//  Digio
//
//  Created by Julio Cesar Pereira on 01/07/24.
//

import Foundation
import os.log
import SpotlightsModule
import DigioCashModule
import ProductsModule

protocol MainViewModelDelegate: AnyObject {
    func didFetchSpotlights()
    func didFetchCash()
    func didFetchProducts()
    func handleNetworkCompletion(hasError: Bool)
}

class MainViewModel {
    var delegate: MainViewModelDelegate?
    var productViewModelList: [ProductViewModel] = []
    var spotlightViewModelList: [SpotlightViewModel] = []
    var digioCashViewModelList: [DigioCashViewModel] = []
    private let fetchSpotlightsUseCase: FetchSpotlightsUseCase
    private let fetchCashUseCase: FetchCashUseCase
    private let fetchProductsUseCase: FetchProductsUseCase
    private let logger = LoggerFactory.makeLogger(category: "network")
    init(fetchSpotlightsUseCase: FetchSpotlightsUseCase, fetchCashUseCase: FetchCashUseCase, fetchProductsUseCase: FetchProductsUseCase) {
        self.fetchSpotlightsUseCase = fetchSpotlightsUseCase
        self.fetchCashUseCase = fetchCashUseCase
        self.fetchProductsUseCase = fetchProductsUseCase
    }
    func fetchItems() {
        let group = DispatchGroup()
        group.enter()
        loadSpotlights(group: group)
        group.enter()
        loadCash(group: group)
        group.enter()
        loadProducts(group: group)
        group.notify(queue: .main) {
            self.handleNetworkCompletion()
        }
    }
    private func loadSpotlights(group: DispatchGroup) {
           fetchSpotlightsUseCase.execute { result in
               defer { group.leave() }
               switch result {
               case .success(let spotlights):
                   self.populateSpotlightViewModelList(spotlights: spotlights)
                   self.delegate?.didFetchSpotlights()
               case .failure(let error):
                   LoggerFactory.logErrorMessage(error.localizedDescription, logger: self.logger)
               }
           }
       }
    private func loadCash(group: DispatchGroup) {
        fetchCashUseCase.execute { result in
            defer { group.leave() }
            switch result {
            case .success(let cash):
                self.populateDigioCashViewModelList(cashList: self.createCashList(from: cash))
                self.delegate?.didFetchCash()
            case .failure(let error):
                LoggerFactory.logErrorMessage(error.localizedDescription, logger: self.logger)
            }
        }
    }
    private func loadProducts(group: DispatchGroup) {
        fetchProductsUseCase.execute { result in
            defer { group.leave() }
            switch result {
            case .success(let products):
                self.populateProductViewModelList(products: products)
                self.delegate?.didFetchProducts()
            case .failure(let error):
                LoggerFactory.logErrorMessage(error.localizedDescription, logger: self.logger)
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
    private func handleNetworkCompletion() {
        delegate?.handleNetworkCompletion(hasError: spotlightViewModelList.isEmpty && digioCashViewModelList.isEmpty && productViewModelList.isEmpty)
    }
}
