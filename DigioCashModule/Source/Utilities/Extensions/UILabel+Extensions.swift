//
//  UILabel+Extensions.swift
//  DigioCashModule
//
//  Created by Julio Cesar Pereira on 03/07/24.
//

import UIKit

extension UILabel {
    public func setupTextFromLocalizable(key: String, fontFamily: String, fontSize: Int) {
        self.text = NSLocalizedString(key, comment: "")
        if let customFont = UIFont(name: fontFamily, size: CGFloat(fontSize)) {
            self.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: customFont)
        } else {
            self.font = UIFont.preferredFont(forTextStyle: .body)
        }
        self.adjustsFontForContentSizeCategory = true
    }
    public func setupText(text: String, fontFamily: String, fontSize: Int) {
        self.text = text
        if let customFont = UIFont(name: fontFamily, size: CGFloat(fontSize)) {
            self.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: customFont)
        } else {
            self.font = UIFont.preferredFont(forTextStyle: .body)
        }
        self.adjustsFontForContentSizeCategory = true
    }
}

