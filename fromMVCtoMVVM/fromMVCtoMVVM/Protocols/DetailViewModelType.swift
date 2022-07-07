//
//  DetailViewModelType.swift
//  fromMVCtoMVVM
//
//  Created by anna on 06.07.2022.
//

import Foundation

protocol DetailViewModelType {
    var description: String { get }
    var age: Box<String?> { get }
}
