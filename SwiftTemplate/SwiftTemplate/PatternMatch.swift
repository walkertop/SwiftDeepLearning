//
//  PatternMatch.swift
//  SwiftDeepLearning
//
//  Created by walker彬 on 2017/7/12.
//  Copyright © 2017年 walker彬. All rights reserved.
//

import Foundation

enum Math {
    static let e  = 2.718281828459045235360287
    static let pi = 3.141592653589793238462643
}

// MARK: - 模式匹配
/// 场景描述：
/// - 如果是管理员登录，就输入账号和密码,成功则返回 true
///                                错误则返回 false
/// - 如果是游客登录，直接返回ture

enum UserType: String {
    case Admin = "管理员"
    case Guest = "游客"
}

func isSuccessLogin(userType: UserType, userName: String, password: String) -> Bool {
    
    switch (userType, userName, password) {
    case (.Admin, "zhangsan", "222"):
        return true
    case (.Admin, _, _):
        return false
    case (.Guest, _, _):
        return true
    }
}

let a = isSuccessLogin(userType: .Admin, userName: "dd", password: "错误")

// MARK: - 关联类型（泛型协议)
/// 场景：协议的A函数中，其参数有很多种，方法的最终确定想交给遵守协议的类或者结构体来制定，就可以使用关联类型
///方式：
/// -1-: 用associatedtype来给某个类型起别名
protocol AssoicateTypeProtocol {
    
    associatedtype customType
    func protocolFunction(type: customType) -> customType
}

/// -2-: 在某个遵守协议的类或结构体中，用typealias 来指定具体类型
class AssociatedClass: AssoicateTypeProtocol {
    typealias customType = Int
    func protocolFunction(type: customType) -> customType {
        return type
    }
}

// MARK: - Enum的关联值
enum Result<Value> {    //泛型枚举
    case success(Value)
    case failure(Error)
}
