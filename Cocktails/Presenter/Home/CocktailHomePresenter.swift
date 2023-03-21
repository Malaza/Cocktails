//
//  CocktailHomePresenter.swift
//  Cocktails
//
//  Created by Mthokozisi Malaza on 2023/03/21.
//

import Foundation

class CocktailHomePresenter: CocktailHomePresenterProtocol {
    
    var router: CocktailHomeRouterProtocol?
    var view: CocktailHomeViewProtocol?
    var interactor: CocktailHomeInteractorProtocol?
    
    func fetchCocktailList() {
        self.interactor?.fetchCocktailList()
    }
    
    func searchCocktailsWithQuery(query: String) {
        self.interactor?.searchCocktailsWithQuery(query: query)
    }
}