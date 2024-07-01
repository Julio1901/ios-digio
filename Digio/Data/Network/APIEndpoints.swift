//
//  APIEndpoints.swift
//  Digio
//
//  Created by Julio Cesar Pereira on 30/06/24.
//

import Foundation

enum APIEndpoints {
    static let baseURL = "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com"
    
    enum Products {
        static let fetch = baseURL + "/sandbox/products"
    }
}
