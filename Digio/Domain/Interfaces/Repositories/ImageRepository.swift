//
//  ImageRepository.swift
//  Digio
//
//  Created by Julio Cesar Pereira on 03/07/24.
//

import Foundation

protocol ImageRepository {
    func fetchImage(from imageURL: URL, completion: @escaping (Result<Data, Error>) -> Void)
}
