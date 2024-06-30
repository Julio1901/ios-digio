//
//  HomeScreen.swift
//  Digio
//
//  Created by Julio Cesar Pereira on 30/06/24.
//

import UIKit

class HomeScreen: UIView {
    private let DEFAULT_LEADING_ANCHOR_VALUE: CGFloat = 10
    private let DEFAULT_TRAILING_ANCHOR_VALUE: CGFloat = -10

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
    private var welcomeLabel2: UILabel = {
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
    var listSpotlightScrollView: UIScrollView = {
        let it = UIScrollView()
        it.backgroundColor = UIColor.orange
        it.translatesAutoresizingMaskIntoConstraints = false
        it.showsHorizontalScrollIndicator = false
        return it
       }()
    var listSpotlighStackView: UIStackView = {
        let it = UIStackView()
        it.backgroundColor = UIColor.orange
        it.axis = .horizontal
        it.alignment = .center
        it.spacing = 4
        it.translatesAutoresizingMaskIntoConstraints = false
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
        addSubview(listSpotlightScrollView)
        listSpotlightScrollView.addSubview(listSpotlighStackView)
    }
    func setupConstraints() {
        let safeArea = safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            logo.topAnchor.constraint(equalTo: safeArea.topAnchor),
            logo.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: DEFAULT_LEADING_ANCHOR_VALUE),
            logo.heightAnchor.constraint(equalToConstant: 24),
            logo.widthAnchor.constraint(equalToConstant: 24),
            welcomeLabel.centerYAnchor.constraint(equalTo: logo.centerYAnchor),
            welcomeLabel.leadingAnchor.constraint(equalTo: logo.trailingAnchor, constant: 4),
            listSpotlightScrollView.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 24),
            listSpotlightScrollView.leadingAnchor.constraint(equalTo: logo.leadingAnchor),
            listSpotlightScrollView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: DEFAULT_TRAILING_ANCHOR_VALUE),
            listSpotlightScrollView.heightAnchor.constraint(equalToConstant: 150),
            listSpotlighStackView.leadingAnchor.constraint(equalTo: listSpotlightScrollView.leadingAnchor),
            listSpotlighStackView.trailingAnchor.constraint(equalTo: listSpotlightScrollView.trailingAnchor),
            listSpotlighStackView.topAnchor.constraint(equalTo: listSpotlightScrollView.topAnchor),
            listSpotlighStackView.bottomAnchor.constraint(equalTo: listSpotlightScrollView.bottomAnchor),
            listSpotlighStackView.heightAnchor.constraint(equalTo: listSpotlightScrollView.heightAnchor),
        ])
    }
}
