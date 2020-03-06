//
//  TemplateTableView.swift
//  SwiftDeepLearning
//
//  Created by 郭彬 on 2020/3/6.
//  Copyright © 2020 walker彬. All rights reserved.
//

import UIKit


class TemplateTableView: UITableView {

    var data = [TemplateModel]()
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        configureTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureTableView() {
        register(TemplateTableViewCell.self, forCellReuseIdentifier: TemplateTableViewCell.identifier)
        delegate = self
        dataSource = self
        self.rowHeight = 300
        contentSize = CGSize(width: 0, height: CGFloat(data.count) * frame.size.height)
    }
}

extension TemplateTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TemplateTableViewCell.identifier, for: indexPath) as! TemplateTableViewCell
        // Configure the cell...
        cell.model = data[indexPath.row]
        return cell
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {

    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    }

}
