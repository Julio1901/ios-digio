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

    var logo: UIImageView = {
        let it = UIImageView()
        it.image = UIImage(named: "icon-digio")
        it.translatesAutoresizingMaskIntoConstraints = false
        return it
    }()
    private var welcomeLabel: UILabel = {
       let it = UILabel()
        it.translatesAutoresizingMaskIntoConstraints = false
        let text = NSLocalizedString("welcome-message", comment: "")
        it.text = "\(text) \(MOCK_USER_NAME)"
        it.textColor = UIColor.black
        it.font = UIFont(name: "Sora-SemiBold", size: 12)
        it.isAccessibilityElement = true
        it.accessibilityHint = "Decorative message: no associated action."
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
        addSubview(logo)
        addSubview(welcomeLabel)
    }
    func setupConstraints() {
        let safeArea = safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            logo.topAnchor.constraint(equalTo: safeArea.topAnchor),
            logo.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: DEFAULT_LEADING_ANCHOR_VALUE),
            logo.heightAnchor.constraint(equalToConstant: 24),
            logo.widthAnchor.constraint(equalToConstant: 24),
            welcomeLabel.centerYAnchor.constraint(equalTo: logo.centerYAnchor),
            welcomeLabel.leadingAnchor.constraint(equalTo: logo.trailingAnchor, constant: 4)
        ])
    }
}
