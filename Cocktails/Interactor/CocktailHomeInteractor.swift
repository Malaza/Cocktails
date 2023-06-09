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
        
        self.service?.executeFetchList(completion: { (data, error) in
            
            guard let data = data as? Data, error == nil else {
                self.presenter?.interactorDidFetchCocktailList(with: .failure(CocktailServiceError.failed))
                print(CocktailServiceError.failed.localizedDescription)
                return
            }
            do {
                let cocktails = try JSONDecoder().decode(DrinksResponse.self, from: data)
                self.presenter?.interactorDidFetchCocktailList(with: .success(cocktails.drinks))
                print(cocktails)
            }
            catch {
                self.presenter?.interactorDidFetchCocktailList(with: .failure(error))
                print(error.localizedDescription)
            }
        })
    }
    
    func searchCocktailsWithQuery(query: String) {
        self.service?.executeSearchWithQuery(query: query, completion: { (response, error) in })
    }
}
