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
            containerView.backgroundColor = .navigationBar
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.textColor = .white
            titleLabel.text = "Cocktails"
        }
    }
    
    @IBOutlet weak var searchButton: UIButton!
    
    
    //MARK: - Variables
    var presenter : CocktailHomePresenterProtocol?
    var cocktails: [CocktailModel]?
    
    
    //MARK: - Setup
    private func setupTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.separatorStyle = .none
        self.tableView.backgroundColor = .tableViewColor
        
        self.tableView.register(UINib(nibName: CocktailHomeTableViewCell.identifier, bundle: nil),
                                forCellReuseIdentifier: CocktailHomeTableViewCell.identifier)
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
    
    
    //MARK: - Button actions
    @IBAction func searchButtonSelected(_ sender: Any) {
        self.presenter?.router?.presentSearchViewController()
    }
    
}


extension CocktailHomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cocktails?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: CocktailHomeTableViewCell.identifier, for: indexPath) as? CocktailHomeTableViewCell {
            cell.configureWithModel(model: self.cocktails?[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
}


extension CocktailHomeViewController: CocktailHomeViewProtocol {
    
    func updateOnSuccess(with cocktails: [CocktailModel]) {
        self.cocktails = cocktails
        self.tableView.reloadData()
    }
    
    func updateOnFailure(with error: String) {}
}
