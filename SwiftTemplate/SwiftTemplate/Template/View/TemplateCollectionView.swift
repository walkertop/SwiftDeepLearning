//
//  TemplateCollectionView.swift
//  SwiftDeepLearning
//
//  Created by 郭彬 on 2020/3/6.
//  Copyright © 2020 walker彬. All rights reserved.
//

import UIKit

class TemplateCollectionView: UICollectionView {

    // MARK - code 初始化操作
    var data = [TemplateModel]()

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        configureCollectionView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func configureCollectionView() {
        register(TemplateCollectionViewCell.self, forCellWithReuseIdentifier: TemplateCollectionViewCell.identifier)
        showsHorizontalScrollIndicator = false
        backgroundColor = .white
        
        delegate = self
        dataSource = self
    }
}

extension TemplateCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: TemplateCollectionViewCell.identifier, for: indexPath) as! TemplateCollectionViewCell
        cell.name = data[indexPath.row].firstName
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
    }
}
