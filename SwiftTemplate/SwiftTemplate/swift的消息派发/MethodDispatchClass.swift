////
////  MethodDispatchClass.swift
////  SwiftDeepLearning
////
////  Created by walker彬 on 2017/8/1.
////  Copyright © 2017年 walker彬. All rights reserved.
////
//
//import Foundation
//
//protocol CustomProtocol {
//    func protocolFunc()
//}
//
//class ClassA: CustomProtocol {
//    private func commonFunc() {
//        print("类自己定义的common方法")
//    }
//    
//    func protocolFunc() {
//        print("protocolFunc")
//    }
//    
//    func classAFunc() {
//        print("classAFunc")
//    }
//    
//    final func finalFunc() {
//        print("finalFunc")
//    }
//}
//
//class  ClassB: ClassA {
//    
//    
//}
//
//extension ClassA {
//    func extensionClassAFunc() {
//        print("extensionClassAFunc")
//    }
//    
//}
//extension ClassB {
//    func commonFunc() {
//        print("类自己定义的common方法")
//    }
//}
//
//struct StructA {
//    func structAFunc() {
//        print("structAFunc")
//    }
//}
//extension StructA {
//    func extensionStructAFunc() {
//        print("extensionStructAFunc")
//    }
//}
//
//struct StructB {
//}
//
//class OCClass: NSObject {
//    func OCFunc() {
//    }
//    @objc func test() {
//        
//    }
//}
//
//
//
//

