//
//  CocktailService.swift
//  Cocktails
//
//  Created by Mthokozisi Malaza on 2023/03/21.
//

import Foundation

typealias GetCompletion = (Any?, CocktailServiceError) -> Void

protocol CocktailServiceProtocol {
    func executeFetchList(completion: @escaping GetCompletion)
    func executeSearchWithQuery(query: String, completion: @escaping GetCompletion)
}


enum CocktailServiceMethod: String {
    case get = "GET"
    case post = "POST"
}

public enum CocktailServiceError: Error {
    case failed
}

class CocktailService: CocktailServiceProtocol {
    
    func executeFetchList(completion: @escaping GetCompletion) {
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://the-cocktail-db.p.rapidapi.com/popular.php")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        
        request.httpMethod = CocktailServiceMethod.get.rawValue
        request.allHTTPHeaderFields = self.getAuthHeaders()
        
        let dataTask = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            
            if (error != nil) {
                completion(nil, .failed)
            }
            else {
                completion(data, .failed)
            }
        })
        
        dataTask.resume()
    }
    
    func executeSearchWithQuery(query: String, completion: @escaping GetCompletion) {
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://the-cocktail-db.p.rapidapi.com/search.php?s=\(query)")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        
        request.httpMethod = CocktailServiceMethod.get.rawValue
        request.allHTTPHeaderFields = self.getAuthHeaders()
        
        let dataTask = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            
            if (error != nil) {
                completion(nil, .failed)
            }
            else {
                completion(data, .failed)
            }
        })
        
        dataTask.resume()
    }
    
    
    //MARK: - Authorization
    private func getAuthHeaders() -> [String: String] {
        return [ "X-RapidAPI-Key": "2204d9a562mshd996f6ee74d1581p1990b2jsn6196342ba4ee", "X-RapidAPI-Host": "the-cocktail-db.p.rapidapi.com" ]
    }
}
