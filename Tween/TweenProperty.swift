//
//  TweenProperty.swift
//  Tween
//
//  Created by 志内 幸彦 on 2018/12/17.
//  Copyright © 2018年 shiuchi. All rights reserved.
//

import Foundation

public protocol TweenFluent {
    func next(_ target: CALayer) -> Tween
    func with(_ target: CALayer) -> Tween
    func start()
}

public protocol TweenProperty: class, TweenFluent {
    func duration(_ value: Double) -> Self
    func delay(_ value: Double) -> Self
    func completion(_ value: @escaping Tween.Completion) -> Self
    func easing(_ value: CAMediaTimingFunction) -> Self
    func and() -> Tween
    
    func create() -> CABasicAnimation
    func applyCompletion()
}


class TweenPropertyImpl<T>: TweenProperty {
    private weak var manager: Tween!
    private let target: CALayer
    private let value: T
    private let property: AnimatableProperties
    
    var duration: Double = 0
    var delay: Double = 0
    var completion: Tween.Completion?
    var easing: CAMediaTimingFunction?
    
    init(target: CALayer, property: AnimatableProperties, value: T, manager: Tween) {
        self.target = target
        self.value = value
        self.property = property
        self.manager = manager
    }
    
    func duration(_ value: Double) -> Self {
        duration = value
        return self
    }
    
    func delay(_ value: Double) -> Self {
        delay = value
        return self
    }
    
    func completion(_ value: @escaping Tween.Completion) -> Self {
        completion = value
        return self
    }
    
    func easing(_ value: CAMediaTimingFunction) -> Self {
        easing = value
        return self
    }
    
    
    /// 他のプロパティを設定する
    ///
    /// - Returns:
    func and() -> Tween {
        return manager
    }
    
    
    func next(_ target: CALayer) -> Tween {
        return manager.next(target)
    }
    
    func with(_ target: CALayer) -> Tween {
        return manager.with(target)
    }
    
    func start() {
        manager.start()
    }
    
    
    func create() -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: property.rawValue)
        animation.fromValue = target.value(forKey: property.rawValue)
        animation.toValue = value
        animation.duration = duration
        animation.timingFunction = easing
        animation.beginTime = CACurrentMediaTime() + delay
        
        animation.autoreverses = false
        animation.repeatCount = 0
        animation.isRemovedOnCompletion = false;
        animation.fillMode = .forwards;
        return animation
    }
    
    func applyCompletion() {
        completion?(true)
    }
}

//extension TweenPropertyImpl: TweenFluent {
//
//    func next() {
//
//    }
//
//    func with() {
//
//    }
//
//    /// Tweenクラスに実行を委譲する
//    func start() {
//        manager?.start()
//    }
//}
