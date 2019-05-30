//
//  ButtonExtension.swift
//  XEBaseUI_Example
//
//  Created by page on 2019/5/23.
//  Copyright © 2019 xiaoe. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    /// 设置标题的按钮
    ///
    /// - Parameters:
    ///   - title: 标题
    ///   - titleColor: 标题颜色
    ///   - fontSize: 字体大小
    ///   - target: 目标对象
    ///   - action: 触发事件
    /// - Returns: buttond对象
    public class func buttonTitle(_ title: String,
                               titleColor: UIColor = UIColor.black,
                               fontSize: CGFloat = 17,
                               weight: UIFont.Weight = .regular,
                               target: Any = self,
                               action: Selector) -> UIButton {
        let btn = UIButton(type: .custom)
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(titleColor, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: fontSize, weight: weight)
        btn.addTarget(target, action: action, for: .touchUpInside)
        return btn
    }
    
    public class func buttonTitle(_ title: String, textColor: UIColor = UIColor.black, fontSize: CGFloat = 17, weight: UIFont.Weight = .regular) -> UIButton {
        let btn = UIButton(type: .custom)
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(textColor, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: fontSize, weight: weight)
        return btn
    }
    
    /// 设置图标(选中图标)按钮
    ///
    /// - Parameters:
    ///   - icon: 正常图标
    ///   - selectedIcon: 选中图片
    ///   - target: 目标
    ///   - action: 事件
    /// - Returns: button对象
    public class func buttonImage(_ icon: String, selectedIcon: String? = nil, target: Any = self, action: Selector? = nil) -> UIButton {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: icon), for: .normal)
        if let selIcon = selectedIcon {
            btn.setImage(UIImage(named:selIcon), for: .selected)
        }
        if let action = action {
            btn .addTarget(target, action: action, for: .touchUpInside)
        }
        return btn
    }
    
    /// 设置图标(高亮图标)按钮
    ///
    /// - Parameters:
    ///   - icon: 正常图标
    ///   - highlightIcon: 选中图片
    ///   - target: 目标
    ///   - action: 事件
    /// - Returns: button对象
    public class func buttonImage(_ icon: String, highlightIcon: String?, target: Any = self, action: Selector) -> UIButton {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(named: icon), for: .normal)
        if let selIcon = highlightIcon {
            btn.setImage(UIImage(named:selIcon), for: .highlighted)
        }
        btn .addTarget(target, action: action, for: .touchUpInside)
        return btn
    }
    
    
    /// 设置背景图片的按钮
    ///
    /// - Parameters:
    ///   - image: 背景图片
    ///   - selectedImage: 背景选中图片
    ///   - target: 目标
    ///   - action: 事件
    /// - Returns: button对象
    public class func buttonBackgoundImage(_ image: String, selectedImage: String?, target: Any = self, action: Selector) -> UIButton {
        let btn = UIButton(type: .custom)
        btn.setBackgroundImage(UIImage(named: image), for: .normal)
        if let selIcon = selectedImage {
            btn.setBackgroundImage(UIImage(named: selIcon), for: .selected)
        }
        btn .addTarget(target, action: action, for: .touchUpInside)
        return btn
    }
    
    /// 设置button选择状态
    ///
    /// - Parameters:
    ///   - title: 选中标题
    ///   - hexColor: 选中标题颜色
    public func setButtonSelectedStyle(_ title: String, hexColor: UIColor = UIColor.black) -> Void {
        self.setTitle(title, for: .selected)
        self.setTitleColor(hexColor, for: .selected)
    }
}
