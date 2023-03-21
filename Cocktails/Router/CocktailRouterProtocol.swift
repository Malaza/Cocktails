//
//  CocktailRouterProtocol.swift
//  Cocktails
//
//  Created by Mthokozisi Malaza on 2023/03/21.
//

import UIKit

protocol CocktailRouterProtocol {
    
    var navigationViewController: UINavigationController? { get }
    
    static func start() -> CocktailRouter
}
