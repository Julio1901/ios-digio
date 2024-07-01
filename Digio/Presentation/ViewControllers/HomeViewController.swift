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
        for spotlight in viewModel.spotlightViewModelList {
            let spotLightCard = SpotlightCard()
            spotLightCard.translatesAutoresizingMaskIntoConstraints = false
            initialScreen.listSpotlighStackView.addArrangedSubview(spotLightCard)
            
        }
        
//        for i in 0..<10 {
//            let cardTest = SpotlightCard()
//            
//            cardTest.translatesAutoresizingMaskIntoConstraints = false
//            cardTest.showContent()
//            initialScreen.listSpotlighStackView.addArrangedSubview(cardTest)
//        }
    }
}

extension HomeViewController: MainViewModelDelegate {
    func didFetchProducts() {
//        print(viewModel.productsResponse?.spotlight)
        setupSpotLightCards()
    }
}
