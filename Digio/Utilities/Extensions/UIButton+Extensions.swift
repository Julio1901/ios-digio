//
//  UIButton+Extensions.swift
//  Digio
//
//  Created by Julio Cesar Pereira on 02/07/24.
//

import UIKit

extension UIButton {
    public func setupText(key: String, for state: UIControl.State, fontFamily: String, fontSize: Int) {
        let text = NSLocalizedString(key, comment: "")
        self.setTitle(text, for: state)
        if let customFont = UIFont(name: fontFamily, size: CGFloat(fontSize)) {
            self.titleLabel?.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: customFont)
        } else {
            let defaultFont = UIFont.preferredFont(forTextStyle: .body)
            self.titleLabel?.font = UIFontMetrics(forTextStyle: .body).scaledFont(for: defaultFont)
        }
        self.titleLabel?.adjustsFontForContentSizeCategory = true
    }
}
