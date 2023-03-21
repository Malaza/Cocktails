//
//  UIImageView.swift
//  Cocktails
//
//  Created by Mthokozisi Malaza on 2023/03/21.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()


extension UIImageView {
    
    func loadThumbnail(urlSting: String) {
        
        guard let url = URL(string: urlSting) else { return }
        self.image = nil
        
        if let imageFromCache = imageCache.object(forKey: urlSting as AnyObject) {
            self.image = imageFromCache as? UIImage
            return
        }
        CocktailService.executeImageDownload(url: url) { (data, error) in
            
            if error == nil {
                guard let imageToCache = UIImage(data: data as! Data) else { return }
                imageCache.setObject(imageToCache, forKey: urlSting as AnyObject)
                self.image = UIImage(data: data as! Data)
            }
            else {
                self.image = UIImage(named: "noImage")
            }
        }
    }
}
