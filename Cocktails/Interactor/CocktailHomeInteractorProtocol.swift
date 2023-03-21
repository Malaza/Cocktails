//
//  CocktailHomeInteractorProtocol.swift
//  Cocktails
//
//  Created by Mthokozisi Malaza on 2023/03/21.
//

import Foundation


protocol CocktailHomeInteractorProtocol {
    
    var presenter: CocktailHomePresenterProtocol? { get set }
    var service: CocktailServiceProtocol? { get set }
    
    func fetchCocktailList()
    func searchCocktailsWithQuery(query: String)
}
