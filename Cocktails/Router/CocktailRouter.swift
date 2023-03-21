//
//  CocktailRouter.swift
//  Cocktails
//
//  Created by Mthokozisi Malaza on 2023/03/21.
//

import UIKit

class CocktailRouter: CocktailRouterProtocol {
    
    //MARK: - Variables
    var navigationViewController: UINavigationController?
    
    static func start() -> CocktailRouter {
        
        var router = CocktailRouter()
        return router
    }
    
    //MARK: - Navigation
}
