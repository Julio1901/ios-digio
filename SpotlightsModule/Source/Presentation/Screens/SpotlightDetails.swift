//
//  SpotlightDetails.swift
//  SpotlightsModule
//
//  Created by Julio Cesar Pereira on 02/07/24.
//

import UIKit

class SpotlightDetails: UIView {
    private let DEFAULT_LEADING_ANCHOR_VALUE: CGFloat = 10
    private let DEFAULT_TRAILING_ANCHOR_VALUE: CGFloat = -10

    private var titleLabel: UILabel = {
        let it = UILabel()
        it.translatesAutoresizingMaskIntoConstraints = false
//        it.setupText(key: "welcome-message", fontFamily: "Sora-SemiBold", fontSize: 12)
//        it.text = "\(it.text ?? "") \(MOCK_USER_NAME)"
        it.text = "Spotlight Details"
        it.textColor = UIColor.black
        it.isAccessibilityElement = true
        it.accessibilityHint = NSLocalizedString("accessibility-welcome-label-description", comment: "")
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
    }
    func setupConstraints() {
        let safeArea = safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: DEFAULT_LEADING_ANCHOR_VALUE)
        ])
    }
}