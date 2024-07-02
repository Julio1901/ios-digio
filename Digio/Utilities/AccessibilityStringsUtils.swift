//
//  AccessibilityStringsUtils.swift
//  Digio
//
//  Created by Julio Cesar Pereira on 02/07/24.
//

import Foundation

class AccessibilityStringsUtils {
    static func getProductAccessibilityStringByKey(localizableKey: String, productName: String) -> String {
        let accessibilityLabel = NSLocalizedString(localizableKey, comment: "")
        let productNameLabel = NSLocalizedString("accessibility-label-name-string", comment: "")
        let formatedAccessibilityLabel = "\(accessibilityLabel) \(productNameLabel) \(productName)."
        return formatedAccessibilityLabel
    }
}
