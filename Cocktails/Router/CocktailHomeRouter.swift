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
    
    
    static func start() -> CocktailHomeViewController {
        
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
        
        return view
    }
    
    //MARK: - Navigation
    func presentDetailViewController(with model: CocktailModel) {
        let viewController =
        self.view?.navigationController?.present(viewController, animated: true)
    }
    
    func presentSearchViewController() {
        
    }
}
