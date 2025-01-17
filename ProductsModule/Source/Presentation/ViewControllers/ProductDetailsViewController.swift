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
        initialScreen.setup(productName: productViewModel.product.name, imageData: productViewModel.imageData,
            description: productViewModel.product.description
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
