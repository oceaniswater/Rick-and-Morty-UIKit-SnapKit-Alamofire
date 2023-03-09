//
//  NetworkConstant.swift
//  Rick and Morty UIKit SnapKit Alamofire
//
//  Created by Марк Голубев on 07.03.2023.
//

import Foundation

class NetworkConstant {
    
    public static var shared: NetworkConstant = NetworkConstant()
    
    private init() {
        // Singleton
    }
    
    public var serverAddress: String {
        get {
            return "https://rickandmortyapi.com/api/"
        }
    }
}
