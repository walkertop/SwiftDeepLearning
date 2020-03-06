//
//  ComplexProtocol.swift
//  SwiftDeepLearning
//
//  Created by walker彬 on 2017/7/20.
//  Copyright © 2017年 walker彬. All rights reserved.
//

import Foundation
import UIKit

//protocol ComplexProtocol {
//    func a()
//    func b()
//    func c()
//    
//    func one()
//    func two()
//    func three()
//}



///


/*
 面向协议变成好处之一：
        对于复杂的协议，对于后期协议的拆分和组合，更加的方便
 
 
 面向协议类似于组装的概念，所以更加灵活和方便
 */
protocol AlphabetProtocol {
    func a()
    func b()
    func c()
    
}

protocol NumberProtocol {
    func one()
    func two()
    func three()
}

typealias ComplexProtocol = AlphabetProtocol & NumberProtocol

class SomeObject: ComplexProtocol {
    func three() {
        
    }

    func two() {
        
    }

    func one() {
        
    }

    func c() {
        
    }

    func b() {
        
    }

    func a() {
        
    }
    
//    let a = 
    let acc = Constant.cell.identifier
}



///新的概念，以命名空间为单位去处理全局的变量
struct Constant {
    struct cell {
        static let identifier = "aaaa"
    }
}


extension UIColor {
    //通过静态成员来定义某个特别的属性，但是缺点是只有一个
    static let myCustomColor = UIColor(red: 25.0, green: 25.0, blue: 25.0, alpha: 0.3)
    
    static func customColor(alpha: CGFloat) -> UIColor {
        return UIColor(red: 25.0, green: 25.0, blue: 25.0, alpha: alpha)
    }
}
//为了灵活性，可以扩展静态方法




/// 实现了一个获取UIView类的协议，可以以类名作为identifier
protocol ViewReuseIdentifier: class {}
extension ViewReuseIdentifier where Self: UIView {
    static var reuserIdentifier: String {
        return String(describing: self)
    }
}
