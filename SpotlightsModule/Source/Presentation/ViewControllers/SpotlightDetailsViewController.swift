//
//  SpotlightDetailsViewController.swift
//  SpotlightsModule
//
//  Created by Julio Cesar Pereira on 02/07/24.
//

import UIKit

public class SpotlightDetailsViewController: UIViewController {
    private var initialScreen = SpotlightDetails()
    public var spotlightViewModel: SpotlightsDetailViewModelProtocol!
    public override func viewDidLoad() {
        super.viewDidLoad()
        initialScreen.setup(productName: spotlightViewModel.spotlight.name, imageData: spotlightViewModel.imageData,
            description: spotlightViewModel.spotlight.description
        )
        view = initialScreen
        setupNavigationBar()
    }
    private func setupNavigationBar() {
            self.navigationController?.isNavigationBarHidden = false
            navigationController?.navigationBar.prefersLargeTitles = false
            navigationController?.navigationBar.frame.size.height = 24
            navigationController?.navigationBar.tintColor = .systemBlue
    }
}


