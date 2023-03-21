//
//  CocktailHomeRouter.swift
//  Cocktails
//
//  Created by Mthokozisi Malaza on 2023/03/21.
//

import UIKit

class CocktailHomeRouter: CocktailHomeRouterProtocol {

    //MARK: - Variables
    var view: (CocktailHomeViewProtocol & UIViewController)?
    
    
    static func start() -> CocktailHomeRouter {
        
        let router = CocktailHomeRouter()
        
        let presenter = CocktailHomePresenter()
        let view = CocktailHomeViewController()
        let interactor = CocktailHomeInteractor()
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
        
        router.view = view
        
        return router
    }
    
    //MARK: - Navigation
}
