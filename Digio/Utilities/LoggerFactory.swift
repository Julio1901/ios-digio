//
//  LoggerFactory.swift
//  Digio
//
//  Created by Julio Cesar Pereira on 01/07/24.
//

import Foundation
import os.log

class LoggerFactory {
    static func makeLogger(category: String) -> OSLog {
        let subsystem = Bundle.main.bundleIdentifier!
        let logger = OSLog(subsystem: subsystem, category: category)
        return logger
    }
    static func logErrorMessage(_ errorMessage: String, logger: OSLog) {
        os_log("Erro: %@", log: logger, type: .error, errorMessage)
    }
}
