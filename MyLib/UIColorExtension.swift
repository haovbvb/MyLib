//
//  ColorExtension.swift
//  XEBaseUI_Example
//
//  Created by page on 2019/5/21.
//  Copyright © 2019 xiaoe. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    /// 根据十六进制字符串,返回颜色
    ///
    /// - Parameters:
    ///   - hexString: 十六进制字符串，例：“#FFF000”，“0xFFF000”，“FFF000”，
    public convenience init(_ hex: String) {
        self.init(hexString: hex, alpha: 1.0)
    }
    
    /// 根据十六进制,返回颜色
    ///
    /// - Parameters:
    ///   - hexInt: 十六进制，例：0xFFF000
    ///   - alpha: 透明度，默认 1.0
    public convenience init(hexInt: Int, alpha: Float = 1.0) {
        let hexString = String(format: "%06X", hexInt)
        self.init(hexString: hexString, alpha: alpha)
    }
    
    /// 根据十六进制字符串,返回颜色
    ///
    /// - Parameters:
    ///   - hexString: 十六进制字符串，例：“#FFF000”，“0xFFF000”，“FFF000”，
    ///   - alpha: 透明度，默认 1.0
    public convenience init(hexString: String, alpha: Float = 1.0) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var mAlpha: CGFloat = CGFloat(alpha)
        var minusLength = 0
        
        let scanner = Scanner(string: hexString)
        
        if hexString.hasPrefix("#") {
            scanner.scanLocation = 1
            minusLength = 1
        }
        if hexString.hasPrefix("0x") {
            scanner.scanLocation = 2
            minusLength = 2
        }
        var hexValue: UInt64 = 0
        scanner.scanHexInt64(&hexValue)
        switch hexString.count - minusLength {
        case 3:
            red = CGFloat((hexValue & 0xF00) >> 8) / 15.0
            green = CGFloat((hexValue & 0x0F0) >> 4) / 15.0
            blue = CGFloat(hexValue & 0x00F) / 15.0
        case 4:
            red = CGFloat((hexValue & 0xF000) >> 12) / 15.0
            green = CGFloat((hexValue & 0x0F00) >> 8) / 15.0
            blue = CGFloat((hexValue & 0x00F0) >> 4) / 15.0
            mAlpha = CGFloat(hexValue & 0x000F) / 15.0
        case 6:
            red = CGFloat((hexValue & 0xFF0000) >> 16) / 255.0
            green = CGFloat((hexValue & 0x00FF00) >> 8) / 255.0
            blue = CGFloat(hexValue & 0x0000FF) / 255.0
        case 8:
            red = CGFloat((hexValue & 0xFF000000) >> 24) / 255.0
            green = CGFloat((hexValue & 0x00FF0000) >> 16) / 255.0
            blue = CGFloat((hexValue & 0x0000FF00) >> 8) / 255.0
            mAlpha = CGFloat(hexValue & 0x000000FF) / 255.0
        default:
            break
        }
        self.init(red: red, green: green, blue: blue, alpha: mAlpha)
    }
    
    /// 根据RGB返回颜色
    ///
    /// - Parameters:
    ///   - red: red色值
    ///   - green: green色值
    ///   - blue: blue色值
    ///   - alpha: 透明度
    public convenience init(byteRed red: Int, green: Int, blue: Int, alpha: Float = 1.0) {
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: CGFloat(alpha))
    }
    
    /// 设置颜色透明度
    public func alpha(_ value: Float) -> UIColor {
        let (red, green, blue, _) = colorComponents()
        return UIColor(red: red, green: green, blue: blue, alpha: CGFloat(value))
    }
    
    public func red(_ value: Int) -> UIColor {
        let (_, green, blue, alpha) = colorComponents()
        return UIColor(red: CGFloat(value)/255.0, green: green, blue: blue, alpha: alpha)
    }
    
    public func green(_ value: Int) -> UIColor {
        let (red, _, blue, alpha) = colorComponents()
        return UIColor(red: red, green: CGFloat(value)/255.0, blue: blue, alpha: alpha)
    }
    
    public func blue(_ value: Int) -> UIColor {
        let (red, green, _, alpha) = colorComponents()
        return UIColor(red: red, green: green, blue: CGFloat(value)/255.0, alpha: alpha)
    }
    
    public func colorComponents() -> (CGFloat, CGFloat, CGFloat, CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return (red, green, blue, alpha)
    }
    
}


extension UIColor {
    
    /// 颜色转图片
    ///
    /// - Parameters:
    ///   - size: 返回的图片大小，默认CGSize(width: 1, height: 1)
    /// - Returns: UIImage?
    public func toImage(size: CGSize = CGSize(width: 1, height: 1)) -> UIImage? {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        self.setFill()
        UIRectFill(rect)
        let image: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    
}
