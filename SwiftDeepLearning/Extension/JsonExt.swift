//
//  JsonExt.swift
//  SwiftDeepLearning
//
//  Created by Bin.Guo on 2019/12/6.
//  Copyright © 2019 walker彬. All rights reserved.
//

import Foundation


public extension Encodable {
  
  /// 将 Encodable 的数据转换为字典类型
  func coverToDictionary() -> [String: Any] {
    guard let jsonData = try? JSONEncoder().encode(self) else {
      return [:]
    }
    guard let json = try? JSONSerialization.jsonObject(with: jsonData, options: []) else {
      return [:]
    }
    guard let params = json as? [String: Any] else {
      return [:]
    }
    return params
  }
}


public extension Dictionary {
  /// 将字典转换为 string
  var json: String {
    let invalidJson = "Not a valid JSON"
    do {
      let jsonData = try JSONSerialization.data(withJSONObject: self, options: [])
      return String(bytes: jsonData, encoding: String.Encoding.utf8) ?? invalidJson
    } catch {
      return invalidJson
    }
  }
  
  func dict2json() -> String {
    return json
  }
}
