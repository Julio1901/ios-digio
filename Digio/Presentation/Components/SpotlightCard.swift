//
//  SpotlightCard.swift
//  Digio
//
//  Created by Julio Cesar Pereira on 30/06/24.
//

import UIKit

class SpotlightCard: UIView {
    let gradientLayer = CAGradientLayer()
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            setupCardView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = self.bounds
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
        //self.addSubview(image)
        setupSkeletonView()
    }
    private func setupConstraints() {
        self.heightAnchor.constraint(equalToConstant: 150).isActive = true
        self.widthAnchor.constraint(equalToConstant: 300).isActive = true
    }
    private func setupSkeletonView() {
       
        self.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        self.layer.cornerRadius = 10
        
        gradientLayer.startPoint = CGPoint(x: 0.2, y: 1)
        gradientLayer.endPoint = CGPoint(x: 1.2, y: 0)
        gradientLayer.colors = [
            UIColor.lightGray.withAlphaComponent(0.5).cgColor,
            UIColor.white.withAlphaComponent(0.5).cgColor,
            UIColor.lightGray.withAlphaComponent(0.5).cgColor
        ]
        gradientLayer.locations = [0, 0.5, 1]
        gradientLayer.frame = self.bounds
        gradientLayer.cornerRadius = 10
        self.layer.addSublayer(gradientLayer)
        
        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = [0, 0, 0.25]
        animation.toValue = [0.75, 1, 1]
        animation.duration = 1.5
        animation.repeatCount = .infinity
        gradientLayer.add(animation, forKey: "shimmer")
    }
}
