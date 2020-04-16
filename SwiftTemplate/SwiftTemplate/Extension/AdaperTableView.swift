//
//  AdaperTableView.swift
//  SwiftTemplate
//
//  Created by 郭彬 on 2020/3/7.
//  Copyright © 2020 walker. All rights reserved.
//

import Foundation
import UIKit

// 自定义一个通用的 TableView

protocol AdaperListProtocol: UITableViewDelegate, UITableViewDataSource  {
    associatedtype T
    var dataSource: [T] { get }
//    var cellClick: ((_ obj: T) -> Void)? { get set}

}

//class AdaperTableView: AdaperListProtocol {
//
//}

class ListAdaper<T, U: UITableView, C: UITableViewCell>: NSObject, AdaperListProtocol {
    
    var cellClick: ((T) -> ())?
    var dataSource = [T]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    private var tableView = U(frame: UIScreen.main.bounds, style: .plain)
    
    init(_ dataSource: [T], in target: UIView, cellClickCallback: @escaping (T) -> ()) {
        super.init()
        self.cellClick = cellClickCallback
        self.dataSource = dataSource
        target.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = C()
        cell.textLabel?.text = "1222"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("开始点击")
        cellClick?(dataSource[indexPath.row])
    }
    
}
