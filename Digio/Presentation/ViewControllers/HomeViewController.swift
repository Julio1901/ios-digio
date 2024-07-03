//
//  ViewController.swift
//  Digio
//
//  Created by Julio Cesar Pereira on 29/06/24.
//

import UIKit
import os.log
import SpotlightsModule
import DigioCashModule
import ProductsModule

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
        let imageRepository = ImageRepositoryImpl(apiClient: apiClient)
        let fetchImageUseCase = FetchImageUseCaseImpl(imageRepository: imageRepository)
        self.viewModel = MainViewModel(
            fetchSpotlightsUseCase: fetchSpotlightsUseCase,
            fetchCashUseCase: fetchCashUseCase,
            fetchProductsUseCase: fetchProductsUseCase,
            fetchImageUseCase: fetchImageUseCase
        )
        viewModel.delegate = self
        viewModel.fetchItems()
    }
    private func setupSpotLightCards() {
        for spotlightViewModel in viewModel.spotlightViewModelList {
            let spotLightCard = SpotlightCard()
            spotLightCard.delegate = self
            spotLightCard.setupCard(viewModel: spotlightViewModel)
            initialScreen.listSpotlighStackView.addArrangedSubview(spotLightCard)
        }
    }
    private func setupDigioCashCards() {
        for cashViewModel in viewModel.digioCashViewModelList {
            let digioCashCard = DigioCashCard()
            digioCashCard.delegate = self
            digioCashCard.setupCard(viewModel: cashViewModel)
            initialScreen.listDigioCashStackView.addArrangedSubview(digioCashCard)
        }
    }
    private func setupProductCards() {
        for productViewModel in viewModel.productViewModelList {
            let productCard = ProductCard()
            productCard.delegate = self
            productCard.setupCard(viewModel: productViewModel)
            initialScreen.listProductStackView.addArrangedSubview(productCard)
        }
    }
}

extension HomeViewController: MainViewModelDelegate {
    func handleNetworkCompletion(hasError: Bool) {
        if hasError {
            initialScreen.setupErrorState()
        }
    }
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

extension HomeViewController: SpotlightCardDelegate {
    func spotlightCardDidTapped(viewModel: any SpotlightsModule.SpotlightsDetailViewModelProtocol) {
        let spotlightDetailsViewController = SpotlightDetailsViewController()
        spotlightDetailsViewController.spotlightViewModel = viewModel
        navigationController?.pushViewController(spotlightDetailsViewController, animated: true)
    }
}

extension HomeViewController: DigioCashCardDelegate {
    func digioCashCardDidTapped(viewModel: any DigioCashModule.DigioCashDetailViewModelProtocol) {
        let digioCashDetailsViewController = DigioCashDetailsViewController()
        digioCashDetailsViewController.digioCashViewModel = viewModel
        navigationController?.pushViewController(digioCashDetailsViewController, animated: true)
    }
}

extension HomeViewController: ProductCardDelegate {
    func productCardDidTapped(viewModel: any ProductsModule.ProductViewModelProtocol) {
        let productDetailsViewController = ProductDetailsViewController()
        productDetailsViewController.productViewModel = viewModel
        navigationController?.pushViewController(productDetailsViewController, animated: true)
    }
}
