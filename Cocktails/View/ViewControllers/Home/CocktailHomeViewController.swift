//
//  CocktailHomeViewController.swift
//  Cocktails
//
//  Created by Mthokozisi Malaza on 2023/03/21.
//

import UIKit

protocol CocktailHomeViewProtocol {
    func updateOnSuccess()
    func updateOnFailure()
}

class CocktailHomeViewController: UIViewController {

    //MARK: - Variables
    var presenter : CocktailHomePresenterProtocol?
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


extension CocktailHomeViewController: CocktailHomeViewProtocol {
    
    func updateOnSuccess() {}
    
    func updateOnFailure() {}
    
}
