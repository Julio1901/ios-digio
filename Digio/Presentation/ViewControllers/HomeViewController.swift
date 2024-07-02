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
        self.viewModel = MainViewModel(productsRepository: repository)
        viewModel.delegate = self
        viewModel.fetchItems()
    }
    private func setupSpotLightCards() {
        for spotlightViewModel in viewModel.spotlightViewModelList {
            let viewModel = spotlightViewModel
            let spotLightCard = SpotlightCard()
            spotLightCard.setupCard(viewModel: viewModel)
            initialScreen.listSpotlighStackView.addArrangedSubview(spotLightCard)
        }
    }
    private func setupDigioCashCards() {
        for cashViewModel in viewModel.digioCashViewModelList {
            let viewModel = cashViewModel
            let digioCashCard = DigioCashCard()
            digioCashCard.setupCardView(viewModel: viewModel)
            initialScreen.listDigioCashStackView.addArrangedSubview(digioCashCard)
        }
    }
    private func setupProductCards() {
        for productViewModel in viewModel.productViewModelList {
            let productCard = ProductCard()
            productCard.viewModel = productViewModel
            initialScreen.listProductStackView.addArrangedSubview(productCard)
        }
    }
}

extension HomeViewController: MainViewModelDelegate {
    func didFetchProducts() {
        setupSpotLightCards()
        setupDigioCashCards()
        setupProductCards()
    }
}
