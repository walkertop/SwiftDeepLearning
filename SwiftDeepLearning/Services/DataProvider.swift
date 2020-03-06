//
//  DataProvider.swift
//  MSInterviewTest
//
//  Created by 郭彬 on 2020/3/5.
//  Copyright © 2020 walker. All rights reserved.
//

import Foundation

class MockDataProvider {
    
    //
    /// fetch local contacts data
    /// - Parameters:
    ///   - name: file's name
    ///   - type: file's type
    static func fetchLocalData<T: Decodable>(name: String, type: String) -> [T]? {
        guard let url = Bundle.main.url(forResource: name, withExtension: type) else { return nil }
        do {
            let data = try Data(contentsOf: url)
            let templateModel = try JSONDecoder().decode([T].self, from: data)
            return templateModel
        } catch let error as Error? {
            debugPrint("读取本地数据出现错误!\(String(describing: error))")
            return nil
        }
    }
}
