//
//  TemplateWorkFlow.swift
//  SwiftTemplate
//
//  Created by 郭彬 on 2020/3/6.
//  Copyright © 2020 walker. All rights reserved.
//

import Foundation

enum TemplateWorkFlow<T> {
    case start
    case step1(content: T)
    case step2(content: T)
    case end
}

class TemplateWorkFlowManager {
    static let manager = TemplateWorkFlowManager()
    private init() { }
    
    private var workflows = [TemplateWorkFlow<String>]()
    
    private func doNextWorkflow() {
      guard workflows.count > 0 else { return }
      let flow = workflows.removeFirst()
      switch flow {
        case .start:
            print("执行 start")
        case .step1(let content):
            print("step1 == \(content)")
        case .step2(let content):
            print("step2 == \(content)")
        case .end:
            print("执行 end")
      }
    }
}


