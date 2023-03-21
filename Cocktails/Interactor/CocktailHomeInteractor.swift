//
//  CocktailHomeInteractor.swift
//  Cocktails
//
//  Created by Mthokozisi Malaza on 2023/03/21.
//

import Foundation


class CocktailHomeInteractor: CocktailHomeInteractorProtocol {
    
    var presenter: CocktailHomePresenterProtocol?
    var service: CocktailServiceProtocol?
    
    
    func fetchCocktailList() {
        
        self.service?.executeFetchList(completion: { (response, error) in
            
//            guar
        })
    }
    
    func searchCocktailsWithQuery(query: String) {
        
        self.service?.executeSearchWithQuery(query: query, completion: { (response, error) in
            
        })
    }
}
