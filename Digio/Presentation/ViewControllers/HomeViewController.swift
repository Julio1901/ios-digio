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
            let spotLightCard = SpotlightCard()
            spotLightCard.viewModel = spotlightViewModel
//            spotLightCard.translatesAutoresizingMaskIntoConstraints = false
            initialScreen.listSpotlighStackView.addArrangedSubview(spotLightCard)
        }
    }
    
    private func setupDigioCashCards() {
        for cashViewModel in viewModel.digioCashViewModelList {
            let digioCashCard = DigioCashCard()
            digioCashCard.viewModel = cashViewModel
//            digioCashCard.translatesAutoresizingMaskIntoConstraints = false
            initialScreen.listDigioCashStackView.addArrangedSubview(digioCashCard)
        }
    }
}

extension HomeViewController: MainViewModelDelegate {
    func didFetchProducts() {
        setupSpotLightCards()
        setupDigioCashCards()
    }
}
