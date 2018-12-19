//
//  Easing.swift
//  Tween
//
//  Created by 志内 幸彦 on 2018/12/11.
//  Copyright © 2018年 shiuchi. All rights reserved.
//

import QuartzCore

public enum Easing {
    case sine
    case quad
    case cubic
    case quart
    case quint
    case expo
    case circ
    case back
    
    public var easeIn: CAMediaTimingFunction {
        switch self {
        case .sine  : return CAMediaTimingFunction(controlPoints: 0.47, 0, 0.745, 0.715)
        case .quad  : return CAMediaTimingFunction(controlPoints: 0.55, 0.085, 0.68, 0.53)
        case .cubic : return CAMediaTimingFunction(controlPoints: 0.55, 0.055, 0.675, 0.19)
        case .quart : return CAMediaTimingFunction(controlPoints: 0.895, 0.03, 0.685, 0.22)
        case .quint : return CAMediaTimingFunction(controlPoints: 0.755, 0.05, 0.855, 0.06)
        case .expo  : return CAMediaTimingFunction(controlPoints: 0.95, 0.05, 0.795, 0.035)
        case .circ  : return CAMediaTimingFunction(controlPoints: 0.6, 0.04, 0.98, 0.335)
        case .back  : return CAMediaTimingFunction(controlPoints: 0.6, -0.28, 0.735, 0.045)
        }
    }
    
    public var easeOut: CAMediaTimingFunction {
        switch self {
        case .sine  : return CAMediaTimingFunction(controlPoints: 0.39, 0.575, 0.565, 1)
        case .quad  : return CAMediaTimingFunction(controlPoints: 0.25, 0.46, 0.45, 0.94)
        case .cubic : return CAMediaTimingFunction(controlPoints: 0.215, 0.61, 0.355, 1)
        case .quart : return CAMediaTimingFunction(controlPoints: 0.165, 0.84, 0.44, 1)
        case .quint : return CAMediaTimingFunction(controlPoints: 0.23, 1, 0.32, 1)
        case .expo  : return CAMediaTimingFunction(controlPoints: 0.19, 1, 0.22, 1)
        case .circ  : return CAMediaTimingFunction(controlPoints: 0.075, 0.82, 0.165, 1)
        case .back  : return CAMediaTimingFunction(controlPoints: 0.175, 0.885, 0.32, 1.275)
        }
    }
    
    public var easeInOut: CAMediaTimingFunction {
        switch self {
        case .sine  : return CAMediaTimingFunction(controlPoints: 0.445, 0.05, 0.55, 0.95)
        case .quad  : return CAMediaTimingFunction(controlPoints: 0.455, 0.03, 0.515, 0.955)
        case .cubic : return CAMediaTimingFunction(controlPoints: 0.645, 0.045, 0.355, 1)
        case .quart : return CAMediaTimingFunction(controlPoints: 0.77, 0, 0.175, 1)
        case .quint : return CAMediaTimingFunction(controlPoints: 0.86, 0, 0.07, 1)
        case .expo  : return CAMediaTimingFunction(controlPoints: 1, 0, 0, 1)
        case .circ  : return CAMediaTimingFunction(controlPoints: 0.785, 0.135, 0.15, 0.86)
        case .back  : return CAMediaTimingFunction(controlPoints: 0.68, -0.55, 0.265, 1.55)
        }
    }
}

//struct Easing {
//    struct Sine {
//        static let easeIn = CAMediaTimingFunction(controlPoints: 0.47, 0, 0.745, 0.715)
//        static let easeOut = CAMediaTimingFunction(controlPoints: 0.39, 0.575, 0.565, 1)
//        static let easeInOut = CAMediaTimingFunction(controlPoints: 0.445, 0.05, 0.55, 0.95)
//    }
//
//    struct Quad {
//        static let eaeIn = CAMediaTimingFunction(controlPoints: 0.55, 0.085, 0.68, 0.53)
//        static let easeOut = CAMediaTimingFunction(controlPoints: 0.25, 0.46, 0.45, 0.94)
//        static let easeInOut = CAMediaTimingFunction(controlPoints: 0.455, 0.03, 0.515, 0.955)
//    }
//
//
//    struct Cubic {
//        static let eaeIn = CAMediaTimingFunction(controlPoints: 0.55, 0.055, 0.675, 0.19)
//        static let easeOut = CAMediaTimingFunction(controlPoints: 0.215, 0.61, 0.355, 1)
//        static let easeInOut = CAMediaTimingFunction(controlPoints: 0.645, 0.045, 0.355, 1)
//    }
//
//    struct Quart {
//        static let eaeIn = CAMediaTimingFunction(controlPoints: 0.895, 0.03, 0.685, 0.22)
//        static let easeOut = CAMediaTimingFunction(controlPoints: 0.165, 0.84, 0.44, 1)
//        static let easeInOut = CAMediaTimingFunction(controlPoints: 0.77, 0, 0.175, 1)
//    }
//
//    struct Quint {
//        static let eaeIn = CAMediaTimingFunction(controlPoints: 0.755, 0.05, 0.855, 0.06)
//        static let easeOut = CAMediaTimingFunction(controlPoints: 0.23, 1, 0.32, 1)
//        static let easeInOut = CAMediaTimingFunction(controlPoints: 0.86, 0, 0.07, 1)
//    }
//
//    struct Expo {
//        static let eaeIn = CAMediaTimingFunction(controlPoints: 0.95, 0.05, 0.795, 0.035)
//        static let easeOut = CAMediaTimingFunction(controlPoints: 0.19, 1, 0.22, 1)
//        static let easeInOut = CAMediaTimingFunction(controlPoints: 1, 0, 0, 1)
//    }
//
//    struct Circ {
//        static let eaeIn = CAMediaTimingFunction(controlPoints: 0.6, 0.04, 0.98, 0.335)
//        static let easeOut = CAMediaTimingFunction(controlPoints: 0.075, 0.82, 0.165, 1)
//        static let easeInOut = CAMediaTimingFunction(controlPoints: 0.785, 0.135, 0.15, 0.86)
//    }
//
//    struct Back {
//        static let eaeIn = CAMediaTimingFunction(controlPoints: 0.6, -0.28, 0.735, 0.045)
//        static let easeOut = CAMediaTimingFunction(controlPoints: 0.175, 0.885, 0.32, 1.275)
//        static let easeInOut = CAMediaTimingFunction(controlPoints: 0.68, -0.55, 0.265, 1.55)
//    }
//}
