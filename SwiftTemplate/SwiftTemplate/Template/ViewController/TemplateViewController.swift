//
//  TemplateViewController.swift
//  SwiftDeepLearning
//
//  Created by 郭彬 on 2020/3/6.
//  Copyright © 2020 walker彬. All rights reserved.
//

import UIKit

class TemplateViewController: UIViewController {
    var templateDataSource: [TemplateModel]?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        fetchMockData()
    }
    
    
    private func setupCollectionAndTableView(with data: [TemplateModel]) {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: TemplateConstants.avatarViewWidth, height: TemplateConstants.avatarViewHeight)
        layout.scrollDirection = .horizontal
        let collectionView = TemplateCollectionView(frame: CGRect(x: 0, y: 88, width: UIScreen.width, height: 80), collectionViewLayout: layout)

        let tableView = TemplateTableView(frame: CGRect(x: 0, y: 168, width: UIScreen.width, height: UIScreen.height - 80), style: .plain)
        collectionView.data = data
        tableView.data = data
        view.addSubview(collectionView)
        view.addSubview(tableView)
    }
    
    private func fetchMockData() {
        DispatchQueue.global().async {
            
            self.templateDataSource = MockDataProvider.fetchLocalData(name: "contacts", type: "json")
            guard let data = self.templateDataSource else { return }
            DispatchQueue.main.async {
                self.setupCollectionAndTableView(with: data)
            }
        }
        
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
