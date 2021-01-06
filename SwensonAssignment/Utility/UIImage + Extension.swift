//
//  UIImage + Extension.swift
//  SwensonAssignment
//
//  Created by Zulqurnain on 06/01/2021.
//  Copyright © 2021 Mohammad Zulqurnain. All rights reserved.
//
import UIKit

extension UIImage {
    func resizeImage(newWidth: CGFloat) -> UIImage {

       let scale = newWidth / self.size.width
       let newHeight = self.size.height * scale
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        self.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        let newImage = (UIGraphicsGetImageFromCurrentImageContext() ?? UIImage(named: "default"))
       UIGraphicsEndImageContext()

        return newImage ?? UIImage(named: "default") as! UIImage
   }
}
