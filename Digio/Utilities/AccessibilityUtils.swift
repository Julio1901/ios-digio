//
//  AccessibilityUtils.swift
//  Digio
//
//  Created by Julio Cesar Pereira on 02/07/24.
//

import Foundation

//enum AccessibilityLanguage {
//    case en
//    case pt
//}

class AccessibilityUtils {
    static func getAccessibilityMessage(key: String) -> String {
        let preferredLanguage = Locale.preferredLanguages.first ?? "pt"
        switch preferredLanguage {
        case "pt":
            return NSLocalizedString("welcome-message-pt", comment: "")
        case "en":
            return NSLocalizedString("welcome-message", comment: "")
        default:
            return NSLocalizedString("welcome-message-pt", comment: "")
        
        }
    }
}
