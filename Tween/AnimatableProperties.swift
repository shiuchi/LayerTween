//
//  TweenProperties.swift
//  Tween
//
//  Created by 志内 幸彦 on 2018/12/07.
//  Copyright © 2018年 shiuchi. All rights reserved.
//

import Foundation

public enum AnimatableProperties: String {
    
    case anchorPoint
    case backgroundColor
    case borderColor
    case borderWidth
    case bounds
    case transform
    case cornerRadius
    case opacity
    case shadowColor
    case shadowOffset
    case shadowOpacity
    case shadowPath
    case shadowRadius
    case x = "position.x"
    case y = "position.y"
    
    case rotation = "transform.rotation"
    
//    var valueType: Any.Type {
//        switch self {
//        case .anchorPoint:
//            return CGPoint.self
//        case .backgroundColor, .borderColor, .shadowColor:
//            return CGColor.self
//        case .bounds:
//            return CGRect.self
//        case .transform:
//            return CGAffineTransform.self
//        case .x, .y, .cornerRadius, .rotation, .opacity, .borderWidth, .shadowOpacity, .shadowRadius:
//            return CGFloat.self
//        case .shadowOffset:
//            return CGSize.self
//        case .shadowPath:
//            return CGPath.self
//        }
//    }
}
