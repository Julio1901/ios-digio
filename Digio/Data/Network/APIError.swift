//
//  APIError.swift
//  Digio
//
//  Created by Julio Cesar Pereira on 30/06/24.
//

import Foundation

enum ApiError: Error {
    case invalidURL
    case invalidResponse
    case decodingError
    case sessionError(Error)
    case noData
}
