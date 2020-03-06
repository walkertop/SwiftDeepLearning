//
//  OOPTemplateController.swift
//  SwiftTemplate
//
//  Created by 郭彬 on 2020/3/6.
//  Copyright © 2020 walker. All rights reserved.
//

import UIKit

class OOPTemplateController: UIViewController {
    
    // 初始化数据源
    private var dataProvider: OOPDataSourceProtocol = OOPTemplateDataSourceProvider()
    private var tableView = TemplateTableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupUI()
        
        dataProvider.requestData(id: "",
                                 willGetFromRemoteBlock: {
                                    // 执行 loading
                                    print("执行 loading")
        }) { (dataSource, error) in
            if dataSource != nil && error == nil {
                
            }
        }
    }
        
    // MARK: - Private
    private func setupUI() {
        tableView = TemplateTableView(frame: CGRect(x: 0, y: 168, width: UIScreen.width, height: UIScreen.height - 80), style: .plain)
        view.addSubview(tableView)
    }
}
