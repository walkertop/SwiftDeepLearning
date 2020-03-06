//
//  HomeController.swift
//  SwiftTemplate
//
//  Created by 郭彬 on 2020/3/6.
//  Copyright © 2020 walker. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    private static var TableViewCellIdentifier = HomeController.identifier + UITableViewCell.identifier
    
    private var dataSource = [String]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
        configureTableView()
        fetchData()
    }
    
    
    private func fetchData() {
        dataSource = ["1", "2"]
        tableView.reloadData()
    }
    
    private func configureTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: HomeController.TableViewCellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setupUI() {
        tableView.frame = CGRect(x: 0, y: 168, width: UIScreen.width, height: UIScreen.height - 80)
        view.addSubview(tableView)
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension HomeController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeController.TableViewCellIdentifier, for: indexPath)
        
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        modalTextAlert(title: "title", accept: "ok", cancel: "cancel", placeholder: "placeholder") { [weak self] (content) in
            guard let self = self, let c = content else { return }
            self.dataSource.append(c)
        }
        
//        let OOPViewController = OOPTemplateController()
//        navigationController?.pushViewController(OOPViewController, animated: true)
    }
}
