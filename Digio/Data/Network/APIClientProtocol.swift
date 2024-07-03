//
//  APIClientProtocol.swift
//  Digio
//
//  Created by Julio Cesar Pereira on 30/06/24.
//

import Foundation

protocol APIClientProtocol {
    func fetchItems(completion: @escaping (Result<Data, Error>) -> Void)
    func fetchImageData(from imageURL: URL, completion: @escaping (Result<Data, Error>) -> Void)
}
