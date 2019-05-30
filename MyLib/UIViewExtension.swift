//
//  UIViewExtensions.swift
//  XEBaseUI_Example
//
//  Created by page on 2019/5/17.
//  Copyright © 2019 xiaoe. All rights reserved.
//

import Foundation
import UIKit


/// 空白页类型
///
/// - common: 通用空白页类型·
public enum XEBlankPageType {
    case common
}

extension UIView {
    
    /// frame
    
    public var x : CGFloat{
        get{
            return self.frame.origin.x
        }
        set(newVal)
        {
            var tmpFrame : CGRect = frame
            tmpFrame.origin.x     = newVal
            frame                 = tmpFrame
        }
    }
    
    public var maxX : CGFloat{
        get{
            return frame.origin.x + frame.size.width
        }
        set(newVal){
            var temFrame: CGRect = frame
            temFrame.origin.x = newVal - temFrame.size.width
            frame = temFrame
        }
    }
    
    public var y : CGFloat{
        get{
            return self.frame.origin.y
        }
        set(newVal){
            var tmpFrame : CGRect = frame
            tmpFrame.origin.y     = newVal
            frame                 = tmpFrame
        }
    }
    
    public var maxY : CGFloat{
        get{
            return frame.origin.y + frame.size.height
        }
    }
    
    public var centerX:CGFloat{
        get{
            return self.center.x
        }set(newValue){
            var tempCenter : CGPoint = self.center
            tempCenter.x             = newValue
            self.center              = tempCenter
        }
    }
    
    public var centerY:CGFloat{
        get{
            return self.center.y
        }
        set(newValue){
            var tempCenter:CGPoint = self.center
            tempCenter.y           = newValue
            self.center            = tempCenter
        }
    }
    
    public var height : CGFloat {
        get {
            return frame.size.height
        }
        set(newVal) {
            var tmpFrame : CGRect = frame
            tmpFrame.size.height  = newVal
            frame                 = tmpFrame
        }
    }
    
    public var width : CGFloat {
        get {
            return frame.size.width
        }
        set(newVal) {
            var tmpFrame : CGRect = frame
            tmpFrame.size.width   = newVal
            frame                 = tmpFrame
        }
    }
    
    /// 加载
    public func beginLoading() {
        /// TODO: something
    }
    
    public func endLoading() {
       /// TODO: something
    }
    
    /// 空白页
    ///
    /// - Parameter:
    ///   - blankPageType: 空白页类型
    ///   - hasData: 是否有数据
    ///   - hasError: 请求错误
    ///   - reloadButtonBlock: 点击刷新按钮回调
    public func configBlankPage(_ blankPageType: XEBlankPageType, hasData:Bool, hasError: Bool, reloadButtonBlock:@escaping () -> ()) {
        
        /// TODO: something
        
    }
    
    /// 自定义切圆角
    ///
    /// - Parameter:
    ///   - coroners: 数组， 例：[.topLeft, .bottomLeft]
    ///   - cornerRadii: 圆角半径
    public func addCorner(_ coroners: UIRectCorner = UIRectCorner.allCorners, cornerRadii: CGFloat)  {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: coroners, cornerRadii: CGSize(width: cornerRadii, height: cornerRadii))
        let cornerLayer = CAShapeLayer()
        cornerLayer.frame = bounds
        cornerLayer.path = path.cgPath
        layer.mask = cornerLayer
    }
    
    /// 画底部虚线
    ///
    /// - Parameter:
    ///   - lineLength: 每一小块虚线的长度
    ///   - lineSpacing: 虚线间隔
    ///   - lineColor: 虚线颜色
    public func drawDashedLine(_ lineLength : Int, lineSpacing : Int, lineColor: UIColor) {
        let shapeLayer = CAShapeLayer()
        shapeLayer.bounds = bounds
        /// 只要是CALayer这种类型,他的anchorPoint默认都是(0.5,0.5)
        shapeLayer.anchorPoint = CGPoint(x: 0, y: 0)
        shapeLayer.strokeColor = lineColor.cgColor
        shapeLayer.lineWidth = 1
        shapeLayer.lineDashPattern = [NSNumber(value: lineLength),NSNumber(value: lineSpacing)]
        let path = CGMutablePath()
        path.move(to: CGPoint(x: bounds.minX, y: bounds.maxY))
        path.addLine(to: CGPoint(x: bounds.maxX, y: bounds.maxY))
        shapeLayer.path = path
        layer.addSublayer(shapeLayer)
    }
    
    /// 画顶部实线
    ///
    /// - Parameter:
    ///   - lineColor: 线颜色，默认lightGray
    public func addLineUp(_ lineColor: UIColor = UIColor.lightGray) {
        let line = UIView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: 0.5))
        line.backgroundColor = lineColor
        addSubview(line)
    }
    
    /// 画底部实线
    ///
    /// - Parameter:
    ///   - lineColor: 线颜色，默认lightGray
    public func addLineBottom(_ lineColor: UIColor = UIColor.lightGray) {
        let line = UIView(frame: CGRect(x: 0, y:frame.size.height, width: frame.size.width, height: 0.5))
        line.backgroundColor = lineColor
        addSubview(line)
    }
    
    
    
    
}
