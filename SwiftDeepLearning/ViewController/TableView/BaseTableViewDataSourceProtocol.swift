//
//  BaseTableViewDataSourceProtocol.swift
//  SwiftDeepLearning
//
//  Created by Bin.Guo on 2019/11/28.
//  Copyright © 2019 walker彬. All rights reserved.
//

import Foundation

public struct ContentList {
  public struct ContentElement {
    var title: String
    var subtitle: String
  }
  
  var list: [ContentElement]
  public init(list: [ContentElement]) {
    self.list = list
  }
}


// 将 tableView 一些复杂的逻辑交给 该protocol 处理
protocol BaseTableViewDataSourceProtocol {
  func numberOfSections() -> Int
  func numberOfRowsInSection(_ section: Int) -> Int
  
  func requestContentList(page: Int?,
                          size: Int?,
                          willGetFromRemoteBlock: () -> Void,
                          remoteFinished block: @escaping ((ContentList?, Error?) -> Void))
  var dataSource: ContentList? { get set }
}

class BaseTableViewDataSourceProvider: BaseTableViewDataSourceProtocol {
  var dataSource: ContentList? {
    set {
      
    }
    get {
      return list
    }
  }
  
  // MARK: - private property

  private var list: ContentList? = {  // 暂时mock处理
    let element0 = ContentList.ContentElement(title: "张三", subtitle: "Zhang San")
    let element1 = ContentList.ContentElement(title: "李四", subtitle: "Li Si")
    let mockList = ContentList(list: [element0, element1])
    return mockList
  }()
  

  func requestContentList(page: Int? = nil,
                          size: Int? = nil,
                          willGetFromRemoteBlock: () -> Void,
                          remoteFinished block: @escaping ((ContentList?, Error?) -> Void)) {
    willGetFromRemoteBlock()
    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {[weak self] in
      guard let self = self else { return }
      block(self.list, nil)
      self.dataSource = self.list
    }
  }
  
  func numberOfRowsInSection(_ section: Int) -> Int {
    return list?.list.count ?? 1
  }
  
  func numberOfSections() -> Int {
    return 2
  }
}
