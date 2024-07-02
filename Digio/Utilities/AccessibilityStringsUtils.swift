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
    
    
//    static func getAccessibilityStringByKeys(localizableKeys: [String]) -> String {
//        var formatedLocalizableString = ""
//        for localizableKey in localizableKeys {
//            let localizableString = NSLocalizedString(localizableKey, comment: "")
//            formatedLocalizableString = "\(formatedLocalizableString) \(localizableString)"
//        }
//        return formatedLocalizableString
//    }
}
