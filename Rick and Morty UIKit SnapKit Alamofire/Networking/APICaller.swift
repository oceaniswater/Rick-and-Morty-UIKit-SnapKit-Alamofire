//
//  APICaller.swift
//  Rick and Morty UIKit SnapKit Alamofire
//
//  Created by Марк Голубев on 07.03.2023.
//

import Foundation
import Alamofire

enum NetworkError: Error {
    case urlError
    case canNotParseData
}

public class APICaller {
    
    static func getCharacters(
        completionHandler: @escaping (_ result: Result<AllCharactersModel, NetworkError>) -> Void) {
            
            let urlString = NetworkConstant.shared.serverAddress + "character"
            
            guard let url = URL(string: urlString) else {
                completionHandler(.failure(.urlError))
                return
            }
            
            AF.request(url).validate().responseDecodable(of: AllCharactersModel.self) { response in
                switch response.result {
                case .success(let characters):
                    completionHandler(.success(characters))
                case .failure(let error):
                    completionHandler(.failure(.canNotParseData))
                }
            }
            

    }
}
