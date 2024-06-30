//
//  HomeScreen.swift
//  Digio
//
//  Created by Julio Cesar Pereira on 30/06/24.
//

import UIKit

class HomeScreen: UIView {
    private let DEFAULT_LEADING_ANCHOR_VALUE: CGFloat = 24
    private let DEFAULT_TRAILING_ANCHOR_VALUE: CGFloat = -24

    init() {
        super.init(frame: .zero)
        self.backgroundColor = UIColor.white
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
