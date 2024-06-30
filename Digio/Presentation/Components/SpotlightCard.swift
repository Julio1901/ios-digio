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
    var image : UIImageView = {
        let it = UIImageView()
        it.image = UIImage(named: "image-spotlight-error")
        it.translatesAutoresizingMaskIntoConstraints = false
        it.layer.cornerRadius = 10
        it.layer.masksToBounds = true
        it.isAccessibilityElement = true
//        it.accessibilityTraits = .image
//        it.accessibilityHint = "Decorative image: no associated action."
//        it.tag = 123
        return it
    }()
    private func setupCardView() {
        setupConstraints()
        self.layer.cornerRadius = 10
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowOpacity = 0.2
        self.layer.shadowRadius = 4
        self.addSubview(image)
    }
    private func setupConstraints() {
        self.heightAnchor.constraint(equalToConstant: 150).isActive = true
        self.widthAnchor.constraint(equalToConstant: 300).isActive = true
    }
}
