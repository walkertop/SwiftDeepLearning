//
//  OOPTemplateDataSourceProvider.swift
//  SwiftTemplate
//
//  Created by 郭彬 on 2020/3/6.
//  Copyright © 2020 walker. All rights reserved.
//

import Foundation


class OOPTemplateDataSourceProvider: OOPDataSourceProtocol {
    
    private var dataSource: [OOPDataModel]?
    
    func numberOfSection() -> Int {
//        guard let data = dataSource else { return 0 }
//        return data.count
        return 1
    }
    
    func numberOfRowInSection(_ section: Int) -> Int {
        // 根据需要处理
        guard let data = dataSource else { return 0 }
        return data.count
    }
    
    
    private var pName: String = ""
    private var qName: String = ""
    
    var name: String {
        return pName + qName
    }
    
    func requestData(id: String, willGetFromRemoteBlock: () -> Void, remoteFinished block: @escaping (([OOPDataModel]?, Error?) -> Void)) {
        
        // 此阶段执行 loading 操作
        willGetFromRemoteBlock()
        
        // 执行网络请求
        DispatchQueue.global().async {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                let item0 = OOPDataModel(name: "苹果", price: "一元")
                let item1 = OOPDataModel(name: "香蕉", price: "二元")
                block([item0, item1], nil)
            }
            // 如果错误，毁掉错误的block, 比如 block(nil, error)
        }
    }
    
    
}
