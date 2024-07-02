//
//  HomeScreen.swift
//  Digio
//
//  Created by Julio Cesar Pereira on 30/06/24.
//

import UIKit

// swiftlint:disable function_body_length
class HomeScreen: UIView {
    private let DEFAULT_LEADING_ANCHOR_VALUE: CGFloat = 10
    private let DEFAULT_TRAILING_ANCHOR_VALUE: CGFloat = -10

    var logo: UIImageView = {
        let it = UIImageView()
        it.image = UIImage(named: "icon-digio")
        it.translatesAutoresizingMaskIntoConstraints = false
        it.isAccessibilityElement = false
        return it
    }()
    private var welcomeLabel: UILabel = {
        let it = UILabel()
        it.translatesAutoresizingMaskIntoConstraints = false
        it.setupText(key: "welcome-message", fontFamily: "Sora-SemiBold", fontSize: 12)
        it.text = "\(it.text ?? "") \(MOCK_USER_NAME)"
        it.textColor = UIColor.black
        it.isAccessibilityElement = true
        it.accessibilityHint = NSLocalizedString("accessibility-welcome-label-description", comment: "")
        return it
    }()
    var listSpotlightScrollView: UIScrollView = {
        let it = UIScrollView()
        it.translatesAutoresizingMaskIntoConstraints = false
        it.showsHorizontalScrollIndicator = false
        it.contentInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
        return it
       }()
    var listSpotlighStackView: UIStackView = {
        let it = UIStackView()
        it.axis = .horizontal
        it.alignment = .center
        it.spacing = 6
        it.translatesAutoresizingMaskIntoConstraints = false
        return it
      }()
    var listDigioCashScrollView: UIScrollView = {
        let it = UIScrollView()
        it.translatesAutoresizingMaskIntoConstraints = false
        it.showsHorizontalScrollIndicator = false
        it.contentInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
        return it
       }()
    var listDigioCashStackView: UIStackView = {
        let it = UIStackView()
        it.axis = .horizontal
        it.alignment = .center
        it.spacing = 6
        it.translatesAutoresizingMaskIntoConstraints = false
        return it
      }()
    private var firstDigioCashLabel: UILabel = {
        let it = UILabel()
        it.translatesAutoresizingMaskIntoConstraints = false
        it.setupText(key: "digio", fontFamily: "Sora-SemiBold", fontSize: 20)
        it.textColor = UIColor(red: 48/255, green: 56/255, blue: 73/255, alpha: 1.0)
        it.isAccessibilityElement = true
        it.accessibilityLabel = ""
        it.accessibilityHint = NSLocalizedString("accessibility-digio-cash-label-description", comment: "")
        return it
    }()
    private var secondDigioCashLabel: UILabel = {
        let it = UILabel()
        it.translatesAutoresizingMaskIntoConstraints = false
        it.setupText(key: "cash", fontFamily: "Sora-SemiBold", fontSize: 20)
        it.textColor = UIColor(red: 138/255, green: 138/255, blue: 138/255, alpha: 1.0)
        it.isAccessibilityElement = false
        return it
    }()
    private var productsLabel: UILabel = {
        let it = UILabel()
        it.translatesAutoresizingMaskIntoConstraints = false
        it.setupText(key: "products", fontFamily: "Sora-SemiBold", fontSize: 20)
        it.textColor = UIColor(red: 48/255, green: 56/255, blue: 73/255, alpha: 1.0)
        it.isAccessibilityElement = true
        it.accessibilityLabel = ""
        it.accessibilityHint = NSLocalizedString("accessibility-products-label-description", comment: "")
        return it
    }()
    var listProductScrollView: UIScrollView = {
        let it = UIScrollView()
        it.translatesAutoresizingMaskIntoConstraints = false
        it.showsHorizontalScrollIndicator = false
        it.contentInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
        return it
       }()
    var listProductStackView: UIStackView = {
        let it = UIStackView()
        it.axis = .horizontal
        it.alignment = .center
        it.spacing = 15
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
        addSubview(firstDigioCashLabel)
        addSubview(secondDigioCashLabel)
        addSubview(listDigioCashScrollView)
        listDigioCashScrollView.addSubview(listDigioCashStackView)
        addSubview(productsLabel)
        addSubview(listProductScrollView)
        listProductScrollView.addSubview(listProductStackView)
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
            listSpotlightScrollView.heightAnchor.constraint(equalToConstant: 170),
            listSpotlighStackView.leadingAnchor.constraint(equalTo: listSpotlightScrollView.leadingAnchor),
            listSpotlighStackView.trailingAnchor.constraint(equalTo: listSpotlightScrollView.trailingAnchor),
            listSpotlighStackView.topAnchor.constraint(equalTo: listSpotlightScrollView.topAnchor),
            listSpotlighStackView.bottomAnchor.constraint(equalTo: listSpotlightScrollView.bottomAnchor),
            listSpotlighStackView.heightAnchor.constraint(equalTo: listSpotlightScrollView.heightAnchor),
            firstDigioCashLabel.topAnchor.constraint(equalTo: listSpotlightScrollView.bottomAnchor, constant: 20),
            firstDigioCashLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: DEFAULT_LEADING_ANCHOR_VALUE),
            secondDigioCashLabel.centerYAnchor.constraint(equalTo: firstDigioCashLabel.centerYAnchor),
            secondDigioCashLabel.leadingAnchor.constraint(equalTo: firstDigioCashLabel.trailingAnchor, constant: 4),
            listDigioCashScrollView.topAnchor.constraint(equalTo: firstDigioCashLabel.bottomAnchor, constant: 10),
            listDigioCashScrollView.leadingAnchor.constraint(equalTo: firstDigioCashLabel.leadingAnchor),
            listDigioCashScrollView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: DEFAULT_TRAILING_ANCHOR_VALUE),
            listDigioCashScrollView.heightAnchor.constraint(equalToConstant: 100),
            listDigioCashStackView.leadingAnchor.constraint(equalTo: listDigioCashScrollView.leadingAnchor),
            listDigioCashStackView.trailingAnchor.constraint(equalTo: listDigioCashScrollView.trailingAnchor),
            listDigioCashStackView.topAnchor.constraint(equalTo: listDigioCashScrollView.topAnchor),
            listDigioCashStackView.bottomAnchor.constraint(equalTo: listDigioCashScrollView.bottomAnchor),
            listDigioCashStackView.heightAnchor.constraint(equalTo: listDigioCashScrollView.heightAnchor),
            productsLabel.topAnchor.constraint(equalTo: listDigioCashScrollView.bottomAnchor, constant: 25),
            productsLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: DEFAULT_LEADING_ANCHOR_VALUE),
            listProductScrollView.topAnchor.constraint(equalTo: productsLabel.bottomAnchor, constant: 20),
            listProductScrollView.leadingAnchor.constraint(equalTo: productsLabel.leadingAnchor),
            listProductScrollView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: DEFAULT_TRAILING_ANCHOR_VALUE),
            listProductScrollView.heightAnchor.constraint(equalToConstant: 130),
            listProductStackView.leadingAnchor.constraint(equalTo: listProductScrollView.leadingAnchor),
            listProductStackView.trailingAnchor.constraint(equalTo: listProductScrollView.trailingAnchor),
            listProductStackView.topAnchor.constraint(equalTo: listProductScrollView.topAnchor),
            listProductStackView.bottomAnchor.constraint(equalTo: listProductScrollView.bottomAnchor),
            listProductStackView.heightAnchor.constraint(equalTo: listProductScrollView.heightAnchor)
        ])
    }
}
// swiftlint:enable function_body_length
