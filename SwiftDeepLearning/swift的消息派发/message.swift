//
//  message.swift
//  SwiftDeepLearning
//
//  Created by walker彬 on 2017/8/2.
//  Copyright © 2017年 walker彬. All rights reserved.
//

import Foundation

class ClassA: NSObject {
}

extension ClassA {
    func message() {}
    @nonobjc func nonObjc() {}
    @objc @inline(__always) dynamic func inlineAndDynamic() {}
    @objc final func finalWithPerformSelectorSupport() {}
}

class ClassB: ClassA {
    
}

let obj = ClassA()

func testMessage() { obj.message() }

func testNonObjc() { obj.nonObjc() }
func testInlineAndDynamic() { obj.inlineAndDynamic() }
func testFinalWithPerformSelectorSupport() { obj.finalWithPerformSelectorSupport() }
func testFinalWithPerformSelector() { obj.perform(#selector(ClassA.finalWithPerformSelectorSupport)) }

