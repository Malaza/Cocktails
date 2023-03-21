//
//  CocktailHomeViewController.swift
//  Cocktails
//
//  Created by Mthokozisi Malaza on 2023/03/21.
//

import UIKit

protocol CocktailHomeViewProtocol {
    func updateOnSuccess(with cocktails: [Cocktail])
    func updateOnFailure(with error: String)
}

class CocktailHomeViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: - Variables
    var presenter : CocktailHomePresenterProtocol?
    
    
    //MARK: - Setup
    private func setupTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.fetchCocktailList()
    }
    
    //MARK: - Helper methods
    private func fetchCocktailList() {
        self.presenter?.fetchCocktailList()
    }
}


extension CocktailHomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0 
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}


extension CocktailHomeViewController: CocktailHomeViewProtocol {
    
    func updateOnSuccess(with cocktails: [Cocktail]) {}
    
    func updateOnFailure(with error: String) {}
}
