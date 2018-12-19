//
//  Tween.swift
//  Tween
//
//  Created by 志内 幸彦 on 2018/12/06.
//  Copyright © 2018年 shiuchi. All rights reserved.
//

import UIKit

final public class Tween {
    public typealias Completion = (Bool) -> ()
    
    private static var dic: [ObjectIdentifier: Tween] = [:]
    
    public static func apply(_ target: CALayer) -> Tween {
        let tween = Tween(target: target)
        dic[target.id] = tween
        return tween
    }
    
    
    private var target: CALayer
    private let id = UUID().uuidString
    private var properties: [AnimatableProperties : TweenProperty] = [:]
    public weak var delegate: TweenDelegate?
    private let group: TweenGroup?
    private(set) public var excuted: Bool = false
    
    private init(target: CALayer, group: TweenGroup? = nil) {
        self.target = target
        self.group = group
    }
    
    /// setting Tween param to x
    ///
    /// - Parameter to: CGFloat
    /// - Returns: Tween
    public func x(_ value: CGFloat ) -> TweenProperty {
        return createTweenProperty(type: .x, value: value)
    }
    
    public func y(_ value: CGFloat) -> TweenProperty {
        return createTweenProperty(type: .y, value: value)
    }
    
    public func cornerRadius(_ value: CGFloat) -> TweenProperty {
        return createTweenProperty(type: .cornerRadius, value: value)
    }
    
    public func anchorPoint(_ value: CGFloat) -> TweenProperty {
        return createTweenProperty(type: .anchorPoint, value: value)
    }
    
    public func backgroundColor(_ value: CGColor) -> TweenProperty {
        return createTweenProperty(type: .backgroundColor, value: value)
    }
    
    public func rotation(_ value: CGFloat) -> TweenProperty {
        return createTweenProperty(type: .rotation, value: CGFloat.pi / 180 * value)
    }
    
    private func createTweenProperty<T>(type: AnimatableProperties, value: T) -> TweenProperty {
        target.removeAnimation(forKey: type.rawValue)
        let p = TweenPropertyImpl(target: target, property: type, value: value, manager: self)
        properties[type] = p
        return p
    }
    
    private func onCompleteTweenPropertie(key: AnimatableProperties) {
        properties.removeValue(forKey: key)
        if properties.isEmpty {
            excuted = false
            //delegate?.onComplete(self)
        }
    }
}

extension Tween: TweenFluent {

    public func next(_ target: CALayer) -> Tween {
        //自身の所属するgroupがあれば渡すなければそ生成
        return Tween(target: target)
    }
    
    public func with(_ target: CALayer) -> Tween {
        return Tween(target: target)
    }
    
    /// Start Tween properties
    public func start() {
        if excuted { return }
        
        excuted = true
        //animationを実行
        properties.forEach{ key , value in
            CATransaction.begin()
            CATransaction.setCompletionBlock { [weak value, weak self] in
                value?.applyCompletion()
                self?.onCompleteTweenPropertie(key: key)
            }
            target.add(value.create(), forKey: key.rawValue)
            CATransaction.commit()
        }
    }
}

//extension Tween: TweenGroup {
//    public func next() {
//
//    }
//
//    public func add(_ tween: TweenGroup) {
//
//    }
//}

extension Tween: Equatable {
    public static func == (lhs: Tween, rhs: Tween) -> Bool {
        return lhs.id == rhs.id
    }
}

public protocol TweenDelegate: class {
    func onComplete(_ tween: TweenGroup)
}


/// Tweenable protocol
public protocol Tweenable: class {
}

private extension Tweenable {
    var id:  ObjectIdentifier {
        return ObjectIdentifier(self)
    }
}

extension CALayer: Tweenable {
}

