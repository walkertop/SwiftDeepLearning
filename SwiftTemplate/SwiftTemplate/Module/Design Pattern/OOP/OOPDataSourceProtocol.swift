//
//  OOPDataSourceProtocol.swift
//  SwiftTemplate
//
//  Created by 郭彬 on 2020/3/6.
//  Copyright © 2020 walker. All rights reserved.
//

import Foundation

struct OOPDataModel: Codable {
    let name: String
    let price: String
}

protocol OOPDataSourceProtocol {
    
    var name: String { get }
    func numberOfSection() -> Int
    func numberOfRowInSection(_ section: Int) -> Int
    
    func requestData(id: String, willGetFromRemoteBlock: () -> Void,
                     remoteFinished block: @escaping (([OOPDataModel]?, Error?) -> Void))
}





