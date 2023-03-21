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
    
    
    //MARK: - Input
    func fetchCocktailList() {
        self.interactor?.fetchCocktailList()
    }
    
    func searchCocktailsWithQuery(query: String) {
        self.interactor?.searchCocktailsWithQuery(query: query)
    }
    
    
    //MARK: - Output
    func interactorDidFetchCocktailList(with result: Result<[CocktailResponse], Error>) {
        
        switch result {
            case .success(let cocktails):
            let model = self.transformToModelList(response: cocktails)
            self.view?.updateOnSuccess(with: model)
            case .failure(let error):
            self.view?.updateOnFailure(with: error.localizedDescription)
        }
    }
    
    func interactorDidSearchForCocktail(with result: Result<[CocktailResponse], Error>) {

    }
    
    
    //MARK: - Helper methods
    private func transformToModelList(response: [CocktailResponse]?) -> [CocktailModel] {
        
        var array = [CocktailModel]()
        
        if let response = response {
            for cocktailResponse in response {
                let cocktail = self.transformToModel(response: cocktailResponse)
                array.append(cocktail)
            }
        }
        return array
    }
    
    private func transformToModel(response: CocktailResponse) -> CocktailModel {
        
        let model = CocktailModel()
        model.idDrink = response.idDrink
        model.strDrink = response.strDrink
        model.strDrinkAlternate = response.strDrinkAlternate
        model.strTags = response.strTags
        model.strVideo = response.strVideo
        model.strCategory = response.strCategory
        model.strAlcoholic = response.strAlcoholic
        model.strGlass = response.strGlass
        model.strInstructions = response.strInstructions
        model.strDrinkThumb = response.strDrinkThumb
        model.strIngredient1 = response.strIngredient1
        model.strIngredient2 = response.strIngredient2
        model.strIngredient3 = response.strIngredient3
        model.strIngredient4 = response.strIngredient4
        model.strIngredient5 = response.strIngredient5
        model.strMeasure1 = response.strMeasure1
        model.strMeasure2 = response.strMeasure2
        model.strMeasure3 = response.strMeasure3
        model.strMeasure4 = response.strMeasure4
        model.strMeasure5 = response.strMeasure5
        model.strImageSource = response.strImageSource
        model.strImageAttribution = response.strImageAttribution
        model.strCreativeCommonsConfirmed = response.strCreativeCommonsConfirmed
        model.dateModified = response.dateModified
        return model
    }
}
