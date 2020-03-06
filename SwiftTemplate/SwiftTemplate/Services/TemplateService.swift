//
//  TemplateService.swift
//  SwiftTemplate
//
//  Created by 郭彬 on 2020/3/6.
//  Copyright © 2020 walker. All rights reserved.
//

import Foundation


/* 处理服务的一个逻辑
 定义一个 public 的  Service 的 protocol
 
 定义一个遵守该协议的 class / struct / enum 等，然后提供实现
 
 如果特殊需要的话，可以再包装一层
 */

// 以 ABTest 举例
public protocol ABTestProtocol {
    
    var state: Bool { get }
    /// 拉取某个灰度功能
    func fetchABTestStatus(id: String) -> Bool
    /// 清除灰度状态
    func clearStatus()

}

public enum ABTestService {
    static let service: ABTestProtocol = ABTest()
}

private class ABTest: ABTestProtocol {
    
    var stat: Bool?
    
    var state: Bool {
        return stat ?? false
    }
    
    func fetchABTestStatus(id: String) -> Bool {
        if let stat = self.stat {
            return stat
        }
        // 请求 AB并且返回状态信息
        return true
    }
    
    func clearStatus() {
        stat = nil
    }
}
