//
//  UIViewController+RuntimeExtension.swift
//  SwiftTemplate
//
//  Created by 郭彬 on 2020/3/11.
//  Copyright © 2020 walker. All rights reserved.
//

import Foundation
import UIKit

/*
 知识点
 1. swift 中没有 dispatch_once的方法来保证代码只执行一次，但 static let 可以保证
 类似于来加载，可以声明一个 callback，来定义实现，在适当时机调用，类型可以是 Void 类型
 static let excute_once: Void = {
 
 }()
 
 2. swift 弱化了 runtime，本身也没有+load()和+initialize(),但为了保证代码在执行其它 class 之前就进行方法交换，可以使用 UIApplacation 的一个特性：
 UIApplication有一个next属性,它会在applicationDidFinishLaunching之前被调用,这个时候通过runtime获取到所有类的列表,然后向所有遵循SelfAware协议的类发送消息.

 NOTE: 但总体来说，在真正的开发实践中，不得不的情况下才使用runtime 黑魔方，因为原本 swift 就弱化这个动态性，强行打开黑魔法，除了维护复杂之外，更会增加不可控性。
 */


infix operator <=>
private extension Selector {
    static func <=>(origin: Selector, swizzle: Selector) {
        if let originMethod = class_getInstanceMethod(UIViewController.self, origin),
            let swizzeMethod = class_getInstanceMethod(UIViewController.self, swizzle) {
            method_exchangeImplementations(originMethod, swizzeMethod)
        }
    }
}

protocol SelfAware: class {
    static func awake()
    static func swizzlingForClass(_ forClass: AnyClass, originalSelector: Selector, swizzledSelector: Selector)
}

extension SelfAware {
    
    static func swizzlingForClass(_ forClass: AnyClass, originalSelector: Selector, swizzledSelector: Selector) {
        let originalMethod = class_getInstanceMethod(forClass, originalSelector)
        let swizzledMethod = class_getInstanceMethod(forClass, swizzledSelector)
        guard (originalMethod != nil && swizzledMethod != nil) else {
            return
        }
        if class_addMethod(forClass, originalSelector, method_getImplementation(swizzledMethod!), method_getTypeEncoding(swizzledMethod!)) {
            class_replaceMethod(forClass, swizzledSelector, method_getImplementation(originalMethod!), method_getTypeEncoding(originalMethod!))
        } else {
            method_exchangeImplementations(originalMethod!, swizzledMethod!)
        }
    }
}

class NothingToSeeHere {
    static func harmlessFunction() {
        let typeCount = Int(objc_getClassList(nil, 0))
        let types = UnsafeMutablePointer<AnyClass>.allocate(capacity: typeCount)
        let autoreleasingTypes = AutoreleasingUnsafeMutablePointer<AnyClass>(types)
        objc_getClassList(autoreleasingTypes, Int32(typeCount))
        for index in 0 ..< typeCount {
            (types[index] as? SelfAware.Type)?.awake()
        }
        types.deallocate()
    }
}
extension UIApplication {
    private static let runOnce: Void = {
        NothingToSeeHere.harmlessFunction()
    }()
    override open var next: UIResponder? {
        UIApplication.runOnce
        return super.next
    }
}

//extension UIViewController: SelfAware {
//    static func awake() {
//        swizzleMethod
//    }
//    private static let swizzleMethod: Void = {
//        let originalSelector = #selector(viewWillAppear(_:))
//        let swizzledSelector = #selector(swizzled_viewWillAppear(_:))
//
//        swizzlingForClass(UIViewController.self, originalSelector: originalSelector, swizzledSelector: swizzledSelector)
//    }()
//
//    @objc func swizzled_viewWillAppear(_ animated: Bool) {
//        swizzled_viewWillAppear(animated)
//        print("swizzled_viewWillAppear")
//    }
//}
