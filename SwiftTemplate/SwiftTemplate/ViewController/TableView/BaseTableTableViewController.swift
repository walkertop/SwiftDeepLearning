//
//  BaseTableTableViewController.swift
//  SwiftDeepLearning
//
//  Created by Bin.Guo on 2019/11/28.
//  Copyright © 2019 walker彬. All rights reserved.
//

import UIKit

class BaseTableTableViewController: UITableViewController {
  
  private var dataSourceProvider: BaseTableViewDataSourceProvider?
  
  init(_ dataSourceProvider: BaseTableViewDataSourceProvider = BaseTableViewDataSourceProvider()) {
    self.dataSourceProvider = dataSourceProvider
    super.init(style: .plain)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
      self.dataSourceProvider?.requestContentList(willGetFromRemoteBlock: {
        print("debug-vira-log-执行loading")
      }, remoteFinished: { (list, nil) in
        print("debug-vira-log-执行结束")
        self.tableView.reloadData()
      })
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
      return self.dataSourceProvider?.numberOfSections() ?? 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
      return self.dataSourceProvider?.numberOfRowsInSection(section) ?? 2
    }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
    let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "custom")
    
    cell.textLabel?.text = self.dataSourceProvider?.dataSource?.list[indexPath.row].title
    cell.detailTextLabel?.text = self.dataSourceProvider?.dataSource?.list[indexPath.row].subtitle
    return cell
  }
  
  private func registerTableCellElement() {
    
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
  }

}

