//
//  NetworkError.swift
//  MVC-N
//
//  Created by anna on 06.07.2022.
//

import Foundation


enum NetworkError: Error {
    case failInternetError
    case noInternetConnection
    case noSuchURL
    case nothingInResponse
}
