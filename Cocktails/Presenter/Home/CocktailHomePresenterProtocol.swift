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
    
    
    //MARK: Input
    func fetchCocktailList()
    func searchCocktailsWithQuery(query: String)
    
    
    //MARK: - Output
    func interactorDidFetchCocktailList(with result: Result<[Cocktail], Error>)
    func interactorDidSearchForCocktail(with result: Result<[Cocktail], Error>) 
}
