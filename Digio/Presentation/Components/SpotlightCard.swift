//
//  SpotlightCard.swift
//  Digio
//
//  Created by Julio Cesar Pereira on 30/06/24.
//

import UIKit
import SpotlightsModule

protocol SpotlightCardDelegate: AnyObject {
    func spotlightCardDidTapped(viewModel: SpotlightsDetailViewModelProtocol)
}

class SpotlightCard: UIView {
    let gradientLayer = CAGradientLayer()
    var delegate: SpotlightCardDelegate!
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = self.bounds
    }
    private var viewModel: SpotlightsDetailViewModelProtocol!
    private var image: UIImageView = {
        let it = UIImageView()
        it.translatesAutoresizingMaskIntoConstraints = false
        it.layer.cornerRadius = 10
        it.layer.masksToBounds = true
        it.contentMode = .scaleToFill
        it.accessibilityTraits = .none
        it.isAccessibilityElement = false
        it.accessibilityLabel = ""
        it.accessibilityHint = ""
        return it
    }()
    func setupCard(viewModel: SpotlightViewModel) {
        self.viewModel = viewModel
        self.translatesAutoresizingMaskIntoConstraints = false
        setupConstraints()
        self.layer.cornerRadius = 10
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowOpacity = 0.2
        self.layer.shadowRadius = 4
        self.isAccessibilityElement = true
        let accessibilityLabel = AccessibilityStringsUtils.getProductAccessibilityStringByKey(
            localizableKey: "accessibility-label-spotlight-card",
            productName: viewModel.spotlight.name
        )
        self.accessibilityLabel = accessibilityLabel
        self.accessibilityHint = NSLocalizedString("accessibility-hint-spotlight-card", comment: "")
        setupSkeletonView()
        setupConstraints()
        handleImage()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewTapped(_:)))
        self.addGestureRecognizer(tapGestureRecognizer)
        self.isUserInteractionEnabled = true
    }
    @objc private func viewTapped(_ sender: UITapGestureRecognizer) {
        delegate.spotlightCardDidTapped(viewModel: self.viewModel)
    }
    private func handleImage() {
        DispatchQueue.global().async {
            self.viewModel.loadImage(completion: { imageData in
                self.removeSkeletonView()
                DispatchQueue.main.async {
                    if let image = imageData {
                        self.image.image = UIImage(data: image)
                    } else {
                        self.setImageErrorState()
                    }
                    self.addContentView()
                }
            })
        }
    }
    private func setupConstraints() {
        self.heightAnchor.constraint(equalToConstant: 150).isActive = true
        self.widthAnchor.constraint(equalToConstant: 300).isActive = true
    }
    private func addContentView() {
        image.heightAnchor.constraint(equalToConstant: 150).isActive = true
        image.widthAnchor.constraint(equalToConstant: 300).isActive = true
        self.addSubview(image)
    }
    private func setupSkeletonView() {
        self.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        self.layer.cornerRadius = 10
        gradientLayer.startPoint = CGPoint(x: -0.3, y: 1)
        gradientLayer.endPoint = CGPoint(x: 1.2, y: -0.3)
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
    private func removeSkeletonView() {
        gradientLayer.removeFromSuperlayer()
        self.backgroundColor = UIColor.white
    }
    func setImageErrorState() {
        self.image.image = UIImage(named: "image-spotlight-error")
        self.accessibilityLabel = AccessibilityStringsUtils.getProductAccessibilityStringByKey(
            localizableKey: "accessibility-label-spotlight-card-error-image-state",
            productName: viewModel.spotlight.name
        )
    }
}
