//
//  CocktailHomePresenterProtocol.swift
//  Cocktails
//
//  Created by Mthokozisi Malaza on 2023/03/21.
//

import Foundation

protocol CocktailHomePresenterProtocol {
    
    var router: CocktailHomeRouterProtocol? { get set }
    var view: CocktailHomeViewProtocol? { get set }
    var interactor: CocktailHomeInteractorProtocol? { get set }
    
    func fetchCocktailList()
    func searchCocktailsWithQuery(query: String)
}
