//
//  SpotlightsDetailViewModelProtocol.swift
//  SpotlightsModule
//
//  Created by Julio Cesar Pereira on 02/07/24.
//

import Foundation

public protocol SpotlightsDetailViewModelProtocol {
//    var spotlight: Spotlight
    var imageData: Data? { get set }
    var hasError: Bool? { get }
}
