//
//  Group.swift
//  Tween
//
//  Created by 志内 幸彦 on 2018/12/17.
//  Copyright © 2018年 shiuchi. All rights reserved.
//

import Foundation

public protocol TweenGroup: TweenFluent {
    func add(_ tween: TweenGroup)
    var delegate: TweenDelegate? { get set }
    var excuted: Bool { get }
}

public protocol Queue: class {
    func execute()
    var delegate: QueueDelegte? { get set }
    var excuting: Bool { get }
    var id: ObjectIdentifier { get }
}

public extension Queue {
    var id: ObjectIdentifier {
        return ObjectIdentifier(self)
    }
}

public protocol QueueDelegte: class {
    func onComplete(_ queue: Queue)
}

public protocol QueueInvoker {
    func add(_ queue: Queue)
}

public final class Serial {
    private var queues: [Queue] = []
    public weak var delegate: QueueDelegte?
    private(set) public var excuting: Bool = false
    
    public init() {
    }
}

extension Serial: Queue {
    
    public func execute() {
        if excuting {
            return
        }
        _execute()
    }
    
    private func _execute() {
        excuting = true
        if let queue = queues.first {
            queue.delegate = self
            queue.execute()
        }
    }
}

extension Serial: QueueInvoker {
    public func add(_ queue: Queue) {
        queues.append(queue)
    }
}

extension Serial: QueueDelegte {
    
    public func onComplete(_ queue: Queue) {
        queues.pop()
        if queues.isEmpty {
            excuting = false
            delegate?.onComplete(self)
        } else {
            _execute()
        }
    }
}

public final class Parallel {
    private var queues: [Queue] = []
    private(set) public var excuting: Bool = false
    public weak var delegate: QueueDelegte?
    
    public init() {
    }
}

extension Parallel: Queue {
    public func execute() {
        if excuting {
            return
        }
        
        _execute()
    }
    
    private func _execute() {
        excuting = true
        queues.forEach { queue in
            queue.delegate = self
            queue.execute()
        }
    }
}

extension Parallel: QueueDelegte {
    
    public func onComplete(_ queue: Queue) {
        queues.removeAll(where: {queue.id == $0.id})
        if queues.isEmpty {
            excuting = false
            delegate?.onComplete(self)
        }
    }
    
}

extension Parallel: QueueInvoker {
    public func add(_ queue: Queue) {
        queues.append(queue)
    }
}

private extension Array {
    
    @discardableResult
    mutating func pop() -> Element? {
        if self.isEmpty {
            return nil
        } else {
            return self.removeFirst()
        }
    }
}
