//
//  CocktailHomeTableViewCell.swift
//  Cocktails
//
//  Created by Mthokozisi Malaza on 2023/03/21.
//

import UIKit

class CocktailHomeTableViewCell: UITableViewCell {

    static let identifier = "CocktailHomeTableViewCell"
    
    //MARK: - Outlets
    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.layer.borderColor = UIColor.lightGray.cgColor
            containerView.layer.borderWidth = 1.0
            containerView.layer.cornerRadius = 10
            containerView.clipsToBounds = true
        }
    }
    
    @IBOutlet weak var cocktailImageView: UIImageView! {
        didSet {
            cocktailImageView.layer.masksToBounds = true
        }
    }
    
    @IBOutlet weak var cocktailTitleLabel: UILabel! {
        didSet {
            cocktailTitleLabel.numberOfLines = 0
        }
    }
    
    
    //MARK: - Lifecycle
    func configureWithModel(model: CocktailModel?) {
        
        self.cocktailTitleLabel.attributedText = self.attributedStringForTitle(title: model?.strDrink ?? "",
                                                                               category: model?.strCategory ?? "")
        
        self.cocktailImageView.loadThumbnail(urlSting: model?.strDrinkThumb ?? "")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    //MARK: - Helper methods
    func getCocktailThumbnail() {
        
    }
    
    private func attributedStringForTitle(title:String, category:String) -> NSAttributedString {
        
        let attrHeading:NSMutableAttributedString
        let attrContent:NSMutableAttributedString
        let mainAttributedString = NSMutableAttributedString()
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .left
        paragraphStyle.paragraphSpacing = 6.0
        
        attrHeading = NSMutableAttributedString(string: title)
        let range = NSRange.init(location: 0, length: title.count)
        attrHeading.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 17, weight: .semibold), range: range)
        attrHeading.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red, range: range)
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
}
