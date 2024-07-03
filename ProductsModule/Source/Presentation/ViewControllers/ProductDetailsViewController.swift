//
//  ProductDetailsViewController.swift
//  ProductsModule
//
//  Created by Julio Cesar Pereira on 03/07/24.
//

import UIKit

public class ProductDetailsViewController: UIViewController {
    private var initialScreen = ProductDetails()
    public var productViewModel: ProductViewModelProtocol!
    public override func viewDidLoad() {
        super.viewDidLoad()
        view = initialScreen
        setupNavigationBar()
        print("test cash \(productViewModel.product.name)")
    }
    private func setupNavigationBar() {
            self.navigationController?.isNavigationBarHidden = false
            let backButton = UIBarButtonItem()
            backButton.title = "Voltar"
            navigationItem.backBarButtonItem = backButton
            navigationController?.navigationBar.prefersLargeTitles = true
            navigationController?.navigationBar.tintColor = .systemBlue
    }


}
