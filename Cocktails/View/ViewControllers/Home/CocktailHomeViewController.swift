//
//  CocktailHomeViewController.swift
//  Cocktails
//
//  Created by Mthokozisi Malaza on 2023/03/21.
//

import UIKit

protocol CocktailHomeViewProtocol {
    func updateOnSuccess(with cocktails: [CocktailModel])
    func updateOnFailure(with error: String)
}

class CocktailHomeViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.backgroundColor = .navigationBarColor
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.textColor = .white
            titleLabel.text = "Cocktails"
        }
    }
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    //MARK: - Variables
    var presenter: CocktailHomePresenterProtocol?
    var cocktails: [CocktailModel]?
    let refreshControl = UIRefreshControl()
    
    
    //MARK: - Setup
    private func setupTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.separatorStyle = .none
        self.tableView.backgroundColor = .tableViewColor
        
        self.refreshControl.addTarget(self, action: #selector(refreshTableView), for: .valueChanged)
        self.tableView.refreshControl = refreshControl
        
        self.tableView.register(UINib(nibName: CocktailHomeTableViewCell.identifier, bundle: nil),
                                forCellReuseIdentifier: CocktailHomeTableViewCell.identifier)
    }
    
    private func setupSearchBar() {
        self.searchBar.delegate = self
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
    
    @objc private func refreshTableView() {
        self.fetchCocktailList()
    }
}


extension CocktailHomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cocktails?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: CocktailHomeTableViewCell.identifier, for: indexPath) as? CocktailHomeTableViewCell {
            let model = self.cocktails?[indexPath.row]
            cell.configureWithModel(model: model)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter?.router?.presentDetailViewController(controller: self, model: self.cocktails?[indexPath.row])
    }
}

extension CocktailHomeViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.count > 1 {
            self.cocktails = cocktails?.filter( { $0.strDrink?.range(of: searchText, options: .caseInsensitive) != nil } )
            self.tableView.reloadData()
        }
    }
}


extension CocktailHomeViewController: CocktailHomeViewProtocol {
    
    func updateOnSuccess(with cocktails: [CocktailModel]) {
        self.cocktails = cocktails
        
        if refreshControl.isRefreshing {
            self.refreshControl.endRefreshing()
        }
        self.tableView.reloadData()
    }
    
    func updateOnFailure(with error: String) {
        //Add retry mech
    }
}
