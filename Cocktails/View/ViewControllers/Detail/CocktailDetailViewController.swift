//
//  CocktailDetailViewController.swift
//  Cocktails
//
//  Created by Mthokozisi Malaza on 2023/03/22.
//

import UIKit

class CocktailDetailViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var navBarView: UIView! {
        didSet {
            navBarView.backgroundColor = .navigationBarColor
        }
    }
    
    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.layer.borderColor = UIColor.borderColor.cgColor
            containerView.layer.borderWidth = 2
            containerView.layer.cornerRadius = 10
        }
    }
    
    @IBOutlet weak var cocktailTitleLabel: UILabel! {
        didSet {
            cocktailTitleLabel.numberOfLines = 0
        }
    }
    
    @IBOutlet weak var cocktailImageView: UIImageView!
    
    @IBOutlet weak var instructionsLabel: UILabel! {
        didSet {
            instructionsLabel.numberOfLines = 0
            instructionsLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        }
    }
    
    @IBOutlet weak var ingredientsLabel: UILabel! {
        didSet {
            ingredientsLabel.numberOfLines = 0
            ingredientsLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        }
    }
    
    
    //MARK: - Variables
    var cocktailModel: CocktailModel?
    
    
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
        self.configureViewWithModel(model: self.cocktailModel)
    }

    private func configureViewWithModel(model: CocktailModel?) {
        
        self.cocktailTitleLabel.attributedText = self.attributedStringForTitle(title: model?.strDrink ?? "", category: model?.strCategory ?? "")
        
        self.cocktailImageView.loadThumbnail(urlSting: model?.strDrinkThumb ?? "")
        
        self.instructionsLabel.text = model?.strInstructions
        
        self.ingredientsLabel.text = self.ingredientsForCocktail(cocktail: model)
    }
    
    
    //MARK: - Helper methods
    private func attributedStringForTitle(title:String, category:String) -> NSAttributedString {
        
        let attrHeading:NSMutableAttributedString
        let attrContent:NSMutableAttributedString
        let mainAttributedString = NSMutableAttributedString()
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        paragraphStyle.paragraphSpacing = 6.0
        
        attrHeading = NSMutableAttributedString(string: title)
        let range = NSRange.init(location: 0, length: title.count)
        attrHeading.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 30, weight: .semibold), range: range)
        attrHeading.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.headingTextColor, range: range)
        mainAttributedString.append(attrHeading)
        
        let stringFormat = String(format: "\n\(category)")
        attrContent = NSMutableAttributedString(string: stringFormat)
        let thisRange = NSRange.init(location: 0, length: stringFormat.count)
        attrContent.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 14, weight: .regular), range: thisRange)
        attrContent.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.black, range: thisRange)
        mainAttributedString.append(attrContent)
        
        mainAttributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle,
                                          range: NSRange.init(location: 0, length: mainAttributedString.length))
        
        return mainAttributedString
    }
    
    private func ingredientsForCocktail(cocktail: CocktailModel?) -> String {
        return "\(cocktail?.strIngredient1 ?? ""), \(cocktail?.strIngredient2 ?? ""), \(cocktail?.strIngredient3 ?? ""), \(cocktail?.strIngredient4 ?? ""), \(cocktail?.strIngredient5 ?? "")"
    }
}
