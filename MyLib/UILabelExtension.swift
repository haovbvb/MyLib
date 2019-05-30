//
//  LabelExtensions.swift
//  XEBaseUI_Example
//
//  Created by page on 2019/5/20.
//  Copyright © 2019 xiaoe. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    
    /// 设置 Label 某个字符颜色
    ///
    /// - Parameters:
    ///   - text: 字符
    ///   - diffColorStr: 需要改变颜色的字符
    ///   - diffColor: 需要改变颜色的字符颜色
    public func setAttrStr(_ diffColorStr: String, diffColor: UIColor) {
        
        guard let text = self.text, text.count > 0 else {
            return
        }
        
        let attrStr = NSMutableAttributedString(string: text)
        if diffColorStr.count > 0  {
            attrStr.addAttribute(NSAttributedString.Key.foregroundColor, value: diffColor, range: (attrStr.string as NSString).range(of: diffColorStr))
        }
        attributedText = attrStr;
    }
    
    /// 设置 Label 某个字符颜色
    ///
    /// - Parameters:
    ///   - attrDict: 字典
    ///   - str: 需要改变颜色的字符
    public func addAttrDict(_ changeStr: String?, attrDict: Dictionary<NSAttributedString.Key, Any>) {
        
        guard let str = changeStr, let text = self.text else {
            return
        }
        
        let attrStr = NSMutableAttributedString(string: text)
        attrStr.addAttributes(attrDict, range: (text as NSString).range(of: str))
        attributedText = attrStr
    }
    
    
    /// 设置行间距
    ///
    /// - Parameters:
    ///   - lineSpacing: 字体行间距，默认行与行之间为default个点的间距，如果小于0则无效
    public func setLineSpacing(_ lineSpacing: CGFloat) {
        
        guard let text = self.text, lineSpacing > 0.01 else {
            return
        }
        
        let attrStr = NSMutableAttributedString(string: text)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        
        attrStr.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attrStr.length))
        
        attributedText = attrStr
    }
    
    

}
