//
//  DigioCashDetailsViewController.swift
//  DigioCashModule
//
//  Created by Julio Cesar Pereira on 03/07/24.
//

import UIKit

public class DigioCashDetailsViewController: UIViewController {
    private var initialScreen = DigioCashDetails()
    public var digioCashViewModel: DigioCashDetailViewModelProtocol!
    public override func viewDidLoad() {
        super.viewDidLoad()
        view = initialScreen
        setupNavigationBar()
        print("test cash \(digioCashViewModel.digioCash.title)")
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
