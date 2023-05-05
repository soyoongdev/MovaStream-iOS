//
//  Extension+UIImage.swift
//  Mova
//
//  Created by HauNguyen on 08/12/2565 BE.
//

import UIKit

extension UIImage {
    
    func resize(to targetSize: CGFloat) -> UIImage? {
        
        if(self.size.width < targetSize)
        {
            return self
        }
        
        let imageView = UIImageView(frame: CGRect(origin: .zero, size: CGSize(width: targetSize, height: CGFloat(ceil(targetSize/size.width * size.height)))))
        imageView.contentMode = .scaleAspectFit
        imageView.image = self
        UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, false, scale)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        imageView.layer.render(in: context)
        guard let result = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
        UIGraphicsEndImageContext()
        return result
    }
    
    
    func tintColor(_ color: UIColor) -> UIImage {
        
        UIGraphicsBeginImageContext(self.size)
        let context = UIGraphicsGetCurrentContext()
        context!.scaleBy(x: 1.0, y: -1.0)
        context!.translateBy(x: 0.0, y: -self.size.height)
        
        context!.setBlendMode(CGBlendMode.multiply)
        
        let rect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
        context!.clip(to: rect, mask: self.cgImage!)
        color.setFill()
        context!.fill(rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}
