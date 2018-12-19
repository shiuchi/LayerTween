//
//  ViewController.swift
//  Demo
//
//  Created by 志内 幸彦 on 2018/12/06.
//  Copyright © 2018年 shiuchi. All rights reserved.
//

import UIKit
import Tween

class ViewController: UIViewController {

    let target = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    
    var serial: Serial!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        target.backgroundColor = UIColor.black
        view.addSubview(target)
        
        //let labe = UILabel()
        
        let g = UITapGestureRecognizer(target: self, action: #selector(start))
        target.addGestureRecognizer(g)
        
        serial = Serial()
        serial.add(HogeQueue("a"))
        serial.add(Wait(1))
        serial.add(HogeQueue("b"))
        serial.add(Wait(1))
        serial.add(HogeQueue("c"))
        serial.add(Wait(1))
        
        let p = Parallel()
        p.add(HogeQueue("1"))
        p.add(HogeQueue("2"))
        p.add(HogeQueue("3"))
        p.add(Wait(3))
        p.add(HogeQueue("4"))
        serial.add(p)
        serial.delegate = self
        serial.execute()
    }

    
    @objc func start() {
        Tween.apply(target.layer)
            .x(200).duration(0.5).completion( {[weak target] _ in
                target?.frame.origin.x = 200
            }).easing(Easing.sine.easeIn)
            .and()
            .y(300).duration(1).delay(0).completion({[weak self] _ in
                self?.target.frame.origin.y = 300
            }).easing(Easing.back.easeInOut)
            .and()
            .rotation(10).duration(1).easing(Easing.back.easeInOut)
            .and()
            .cornerRadius(target.frame.width * 0.5).duration(1).easing(Easing.quart.easeOut)
            .start()
        
    }
}

extension ViewController: QueueDelegte {
    func onComplete(_ queue: Queue) {
        print("ssss")
    }
    
    
}

class HogeQueue: Queue {
    
    weak var delegate: QueueDelegte?
    var excuting: Bool = false
    var str: String
    
    init(_ str: String) {
        self.str = str
    }
    
    deinit {
        print("deinit")
    }
    
    func execute() {
        print(str)
        delegate?.onComplete(self)
    }
}

class Wait: Queue {
    
    weak var delegate: QueueDelegte?
    var excuting: Bool = false
    let delay: Double
    
    init(_ delay: Double) {
        self.delay = delay
    }
    
    func execute() {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            self.delegate?.onComplete(self)
        }
    }
    
}
