//
//  CocktailDetailViewController.swift
//  Cocktails
//
//  Created by Mthokozisi Malaza on 2023/03/22.
//

import UIKit

class CocktailDetailViewController: UIViewController {

    
    //MARK: - Variables
    var cocktailModel: CocktailModel?
    
    
    //MARK: - Setup
    
    
    //MARK: - Lifecycle
    convenience init(cocktailModel: CocktailModel?) {
        self.init()
        self.cocktailModel = cocktailModel
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
