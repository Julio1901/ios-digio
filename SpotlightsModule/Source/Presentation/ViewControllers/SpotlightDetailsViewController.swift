//
//  SpotlightDetailsViewController.swift
//  SpotlightsModule
//
//  Created by Julio Cesar Pereira on 02/07/24.
//

import UIKit

public class SpotlightDetailsViewController: UIViewController {
    private var initialScreen = SpotlightDetails()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view = initialScreen
    }
}


