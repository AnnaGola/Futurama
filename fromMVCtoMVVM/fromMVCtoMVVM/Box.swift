//
//  Box.swift
//  fromMVCtoMVVM
//
//  Created by anna on 06.07.2022.
//

import Foundation

class Box<T> {
    
    typealias Observer = (T) -> ()
    
    var observer: Observer?
    
    var value: T {
        didSet {
            observer?(value)
        }
    }
    
    func binding(observer: @escaping Observer) {
        self.observer = observer
        observer(value)
    }
    
    init(_ value: T) {
        self.value = value
    }
}
