//
//  ProductCard.swift
//  Digio
//
//  Created by Julio Cesar Pereira on 01/07/24.
//

import UIKit
import ProductsModule

protocol ProductCardDelegate: AnyObject {
    func productCardDidTapped(viewModel: ProductViewModelProtocol)
}

class ProductCard: UIView {
    private let gradientLayer = CAGradientLayer()
    var delegate: ProductCardDelegate!
    var imageWidth = 60
    var imageHeigth = 60
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
    private var viewModel: ProductViewModelProtocol!
    var image: UIImageView = {
        let it = UIImageView()
        it.translatesAutoresizingMaskIntoConstraints = false
        it.layer.cornerRadius = 10
        it.layer.masksToBounds = true
        it.contentMode = .scaleAspectFill
        it.accessibilityTraits = .none
        it.isAccessibilityElement = false
        it.accessibilityLabel = ""
        it.accessibilityHint = ""
        return it
    }()
    func setupCard(viewModel: ProductViewModelProtocol) {
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
            localizableKey: "accessibility-label-product-card",
            productName: viewModel.product.name
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
        delegate.productCardDidTapped(viewModel: self.viewModel)
    }
    private func handleImage() {
        DispatchQueue.global().async {
            self.viewModel.loadImage(completion: { imageData in
                self.removeSkeletonView()
                DispatchQueue.main.async {
                    if let imageData = imageData, let image = UIImage(data: imageData) {
                        self.image.image = image
                    } else {
                        self.imageWidth = 120
                        self.imageHeigth = 120
                        self.setImageErrorState()
                    }
                    self.addContentView(imageWidth: self.imageWidth, imageHeigth: self.imageHeigth)
                }
            })
        }
    }
    private func setupConstraints() {
        self.heightAnchor.constraint(equalToConstant: 120).isActive = true
        self.widthAnchor.constraint(equalToConstant: 120).isActive = true
    }
    private func addContentView(imageWidth: Int, imageHeigth: Int) {
        self.addSubview(image)
        image.heightAnchor.constraint(equalToConstant: CGFloat(imageHeigth)).isActive = true
        image.widthAnchor.constraint(equalToConstant: CGFloat(imageWidth)).isActive = true
        image.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        image.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
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
    private func setImageErrorState() {
        self.image.image = UIImage(named: "image-product-error")
        self.accessibilityLabel = AccessibilityStringsUtils.getProductAccessibilityStringByKey(
            localizableKey: "accessibility-label-product-card-error-image-state",
            productName: viewModel.product.name
        )
        self.image.heightAnchor.constraint(equalToConstant: 120).isActive = true
        self.image.widthAnchor.constraint(equalToConstant: 120).isActive = true
        self.image.contentMode = .scaleAspectFit
    }
}
