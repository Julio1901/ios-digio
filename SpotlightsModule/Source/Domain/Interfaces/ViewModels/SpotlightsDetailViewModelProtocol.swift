//
//  SpotlightsDetailViewModelProtocol.swift
//  SpotlightsModule
//
//  Created by Julio Cesar Pereira on 02/07/24.
//

import Foundation

public protocol SpotlightsDetailViewModelProtocol {
    var spotlight: Spotlight { get set}
    var imageData: Data? { get set }
    var hasError: Bool? { get }
    func loadImage(completion: @escaping (_ imageData: Data?) -> Void)
}
