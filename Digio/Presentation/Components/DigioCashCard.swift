//
//  DigioCashCard.swift
//  Digio
//
//  Created by Julio Cesar Pereira on 01/07/24.
//

import UIKit

class DigioCashCard: UIView {
    let gradientLayer = CAGradientLayer()

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
    private var viewModel: DigioCashViewModel!
    var image: UIImageView = {
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
    func setupCardView(viewModel: DigioCashViewModel) {
        self.viewModel = viewModel
        self.translatesAutoresizingMaskIntoConstraints = false
        setupConstraints()
        self.layer.cornerRadius = 10
        self.isAccessibilityElement = true
        let accessibilityLabel = AccessibilityStringsUtils.getProductAccessibilityStringByKey(
            localizableKey: "accessibility-label-digio-cash-card",
            productName: viewModel.digioCash.title
        )
        self.accessibilityLabel = accessibilityLabel
        self.accessibilityHint = NSLocalizedString("accessibility-hint-spotlight-card", comment: "")
        setupSkeletonView()
        setupConstraints()
        handleImage()
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
        self.heightAnchor.constraint(equalToConstant: 95).isActive = true
        self.widthAnchor.constraint(equalToConstant: 300).isActive = true
    }
    private func addContentView() {
        image.heightAnchor.constraint(equalToConstant: 95).isActive = true
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
    }
}
