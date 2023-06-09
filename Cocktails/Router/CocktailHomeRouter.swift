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
    
    
    static func start() -> CocktailHomeRouterProtocol {
        
        let router = CocktailHomeRouter()
        
        let presenter = CocktailHomePresenter()
        let view = CocktailHomeViewController()
        let interactor = CocktailHomeInteractor()
        let service = CocktailService()
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        interactor.service = service
        
        presenter.router = router
        presenter.view = view
        presenter.interactor = interactor
        
        router.view = view
        return router
    }
    
    //MARK: - Navigation
    func presentDetailViewController(controller: UIViewController, model: CocktailModel?) {
        let viewController = CocktailDetailViewController(cocktailModel: model)
        controller.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func presentSearchViewController() {
        
    }
}
