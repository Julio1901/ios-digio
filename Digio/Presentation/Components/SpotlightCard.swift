//
//  SpotlightCard.swift
//  Digio
//
//  Created by Julio Cesar Pereira on 30/06/24.
//

import UIKit

class SpotlightCard: UIView {
    override init(frame: CGRect) {
            super.init(frame: frame)
            setupCardView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupCardView() {
            setupConstraints()
            self.backgroundColor = .blue
            self.layer.cornerRadius = 10
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowOffset = CGSize(width: 0, height: 2)
            self.layer.shadowOpacity = 0.2
            self.layer.shadowRadius = 4
    }
    private func setupConstraints() {
        self.heightAnchor.constraint(equalToConstant: 150).isActive = true
        self.widthAnchor.constraint(equalToConstant: 250).isActive = true
    }
}
