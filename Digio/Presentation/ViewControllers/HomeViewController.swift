//
//  ViewController.swift
//  Digio
//
//  Created by Julio Cesar Pereira on 29/06/24.
//

import UIKit
import os.log

class HomeViewController: UIViewController {
    private var initialScreen = HomeScreen()
    private var viewModel: MainViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        view = initialScreen
        let apiClient = APIClient()
        let repository = ProductsRepositoryImpl(apiClient: apiClient)
        let fetchSpotlightsUseCase = FetchSpotlightsUseCaseImpl(repository: repository)
        let fetchCashUseCase = FetchCashUseCaseImpl(repository: repository)
        let fetchProductsUseCase = FetchProductsUseCaseImpl(repository: repository)
        self.viewModel = MainViewModel(
            fetchSpotlightsUseCase: fetchSpotlightsUseCase,
            fetchCashUseCase: fetchCashUseCase,
            fetchProductsUseCase: fetchProductsUseCase
        )
        viewModel.delegate = self
        viewModel.fetchItems()
    }
    private func setupSpotLightCards() {
        for spotlightViewModel in viewModel.spotlightViewModelList {
            let spotLightCard = SpotlightCard()
            spotLightCard.setupCard(viewModel: spotlightViewModel)
            initialScreen.listSpotlighStackView.addArrangedSubview(spotLightCard)
        }
    }
    private func setupDigioCashCards() {
        for cashViewModel in viewModel.digioCashViewModelList {
            let digioCashCard = DigioCashCard()
            digioCashCard.setupCardView(viewModel: cashViewModel)
            initialScreen.listDigioCashStackView.addArrangedSubview(digioCashCard)
        }
    }
    private func setupProductCards() {
        for productViewModel in viewModel.productViewModelList {
            let productCard = ProductCard()
            productCard.setupCardView(viewModel: productViewModel)
            initialScreen.listProductStackView.addArrangedSubview(productCard)
        }
    }
}

extension HomeViewController: MainViewModelDelegate {
    func didFetchSpotlights() {
        setupSpotLightCards()
    }
    func didFetchCash() {
        setupDigioCashCards()
    }
    func didFetchProducts() {
        setupProductCards()
    }
}

