//
//  UIImageView+Extension.swift
//  Pargo
//
//  Created by Apple on 26/09/21.
//

import UIKit
//import SDWebImage


/*extension UIImageView {
    
    func setImageWithString(_ urlString:String){
        
        if urlString.isEmpty {
            self.image = UIImage(named: Images.profile)
            return
        }
        else {
            let imageString = "\(URLs.baseURL.rawValue)\(urlString)"            
            setImage(urlString: imageString)
        }
    }
    
    func defaultImage(){        
        DispatchQueue.main.async {
            self.image = UIImage(named: Images.profile)
        }
    }
    func defaultCoverImage(){
        DispatchQueue.main.async {
            self.image = UIImage(named: Images.coverImage)
        }
    }
    
    func setImage(urlString:String){
        
        if !urlString.isEmpty {
            
            DispatchQueue.main.async {
                
                self.sd_imageIndicator = SDWebImageActivityIndicator.medium
                self.sd_imageIndicator?.startAnimatingIndicator()
            }
            
            let imageURL = URL(string: urlString)
            
            self.sd_setImage(with: imageURL, completed:  { [weak self]
                (image, error, cacheType, url) in
                
                DispatchQueue.main.async {
                    self?.sd_imageIndicator?.stopAnimatingIndicator()
                }
            })
        }
        
    }
}
*/


