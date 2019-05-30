//
//  UIImageExtension.swift
//  XEBaseUI_Example
//
//  Created by page on 2019/5/23.
//  Copyright © 2019 xiaoe. All rights reserved.
//

import Foundation
import UIKit


extension UIImage {
    
    /// 图片拉伸
    ///
    /// - Parameters:
    ///   - imageName: 图片名称
    /// - Returns: UIImage
    public class func getImageWithImageName(imageName: String) -> UIImage {
        
        var image = UIImage(named: imageName)
        
        //图片的中心点
        let width = image?.size.width ?? 0/2.0
        let height = image?.size.height ?? 0/2.0
        
        let edge = UIEdgeInsets(top: height - 1.0, left: width - 1.0, bottom: height - 1.0, right: width - 1.0)
        image = image?.resizableImage(withCapInsets: edge, resizingMode: UIImage.ResizingMode.stretch)
        return image!
    }
    
    /// 通过颜色尺寸来生成一个纯色图片
    ///
    /// - Parameters:
    ///   - color: 图片颜色
    ///   - size: 返回的图片大小，默认CGSize(width: 1, height: 1)
    /// - Returns: UIImage?
    public class func imageFromColor(_ color: UIColor = UIColor.lightGray, size: CGSize = CGSize(width: 1, height: 1)) -> UIImage? {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
}
