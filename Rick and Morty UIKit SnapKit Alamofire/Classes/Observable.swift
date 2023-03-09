//
//  Observable.swift
//  Rick and Morty UIKit SnapKit Alamofire
//
//  Created by Марк Голубев on 07.03.2023.
//

import Foundation

class Observable<T> {
    
    var value: T? {
        didSet {
            DispatchQueue.main.async {
                self.listener?(self.value)
            }
        }
    }
    
    init( _ value: T?) {
        self.value = value
    }
    
    private var listener: ((T?) -> Void)?
    
    func bind( _ listener: @escaping ((T?) -> Void)) {
        self.listener = listener
    }
}
