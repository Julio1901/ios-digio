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
        setupViews()
        let apiClient = APIClient()
        let repository = ProductsRepositoryImpl(apiClient: apiClient)
        self.viewModel = MainViewModel(productsRepository: repository)
        viewModel.delegate = self
        viewModel.fetchItems()
    }
    func setupViews() {
        for i in 0..<10 {
            let cardTest = SpotlightCard()
            cardTest.translatesAutoresizingMaskIntoConstraints = false
            cardTest.showContent()
            initialScreen.listSpotlighStackView.addArrangedSubview(cardTest)
        }
    }
}

extension HomeViewController: MainViewModelDelegate {
    func didFetchProducts() {
        print(viewModel.productsResponse?.spotlight)
    }
}
