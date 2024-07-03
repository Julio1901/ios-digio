//
//  DigioCashDetails.swift
//  DigioCashModule
//
//  Created by Julio Cesar Pereira on 03/07/24.
//

import UIKit

class DigioCashDetails: UIView {
    private let DEFAULT_LEADING_ANCHOR_VALUE: CGFloat = 10
    private let DEFAULT_TRAILING_ANCHOR_VALUE: CGFloat = -10

    private var titleLabel: UILabel = {
        let it = UILabel()
        it.translatesAutoresizingMaskIntoConstraints = false
        it.textColor = UIColor.black
        it.setupTextFromLocalizable(key: "product-details-screen-title", fontFamily: "Sora-SemiBold", fontSize: 20)
        it.isAccessibilityElement = true
        it.accessibilityHint = NSLocalizedString("accessibility-hint-details-screen-default", comment: "")
        return it
    }()
    private var productNameLabel: UILabel = {
        let it = UILabel()
        it.translatesAutoresizingMaskIntoConstraints = false
        it.textColor = UIColor.black
        it.isAccessibilityElement = true
        it.accessibilityHint = NSLocalizedString("product-name-hint", comment: "")
        return it
    }()
    private var image: UIImageView = {
        let it = UIImageView()
        it.translatesAutoresizingMaskIntoConstraints = false
        it.layer.cornerRadius = 10
        it.layer.masksToBounds = true
        it.contentMode = .scaleToFill
        it.accessibilityTraits = .none
        it.isAccessibilityElement = true
        it.accessibilityHint = NSLocalizedString("accessibility-hint-details-screen-image-default", comment: "")
        it.accessibilityLabel = NSLocalizedString("accessibility-label-details-screen-image-default", comment: "")
        return it
    }()
    private var descriptionLabel: UILabel = {
        let it = UILabel()
        it.translatesAutoresizingMaskIntoConstraints = false
        it.textColor = UIColor(red: 138/255, green: 138/255, blue: 138/255, alpha: 1.0)
        it.numberOfLines = 0
        it.lineBreakMode = .byWordWrapping
        it.isAccessibilityElement = true
        it.accessibilityHint = NSLocalizedString("accessibility-hint-details-screen-description-default", comment: "")
        return it
    }()
    init() {
        super.init(frame: .zero)
        self.backgroundColor = UIColor.white
        addSubViews()
        setupConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func addSubViews() {
        addSubview(titleLabel)
        addSubview(image)
        addSubview(productNameLabel)
        addSubview(descriptionLabel)
    }
    func setup(productName: String, imageData: Data?, description: String) {
        setupImage(imageData: imageData)
        setupProductName(text: productName)
        setupDescription(text: description)
    }
    private func setupProductName(text: String) {
        self.productNameLabel.setupText(text: text, fontFamily: "Sora-SemiBold", fontSize: 15)
    }
    private func setupImage(imageData: Data?) {
        guard let imageData else { return }
        self.image.image = UIImage(data: imageData)
    }
    private func setupDescription(text: String) {
        self.descriptionLabel.setupText(text: text, fontFamily: "Sora-SemiBold", fontSize: 18)
    }
    func setupConstraints() {
        let safeArea = safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 15),
            titleLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            productNameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25),
            productNameLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: DEFAULT_LEADING_ANCHOR_VALUE),
            image.topAnchor.constraint(equalTo: productNameLabel.bottomAnchor, constant: 15),
            image.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: DEFAULT_LEADING_ANCHOR_VALUE),
            image.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: DEFAULT_TRAILING_ANCHOR_VALUE),
            image.heightAnchor.constraint(equalToConstant: 200),
            descriptionLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 15),
            descriptionLabel.leadingAnchor.constraint(equalTo: image.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: image.trailingAnchor)
        ])
    }
}
