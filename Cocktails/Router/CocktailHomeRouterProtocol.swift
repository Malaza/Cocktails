//
//  CocktailHomeRouterProtocol.swift
//  Cocktails
//
//  Created by Mthokozisi Malaza on 2023/03/21.
//

import UIKit

protocol CocktailHomeRouterProtocol {
    
    var view: (CocktailHomeViewProtocol & UIViewController)? { get }
    
    static func start() -> CocktailHomeViewController
    
    
    func presentDetailViewController(with model: CocktailModel)
    func presentSearchViewController()
}
