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

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        view = initialScreen
        setupViews()
    }
    
    func setupViews() {
        for i in 0..<10 {
            let cardTest = SpotlightCard()
            cardTest.translatesAutoresizingMaskIntoConstraints = false
            initialScreen.listSpotlighStackView.addArrangedSubview(cardTest)
        }
    }
}
