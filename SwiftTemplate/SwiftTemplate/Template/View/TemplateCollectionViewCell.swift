//
//  TemplateCollectionViewCell.swift
//  SwiftDeepLearning
//
//  Created by 郭彬 on 2020/3/6.
//  Copyright © 2020 walker彬. All rights reserved.
//

import UIKit

class TemplateCollectionViewCell: UICollectionViewCell {
    
    var name: String? {
        didSet {
            nameLabel.text = name
        }
    }
       
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        nameLabel.frame = CGRect(x: 0, y: 8, width: 100, height: 100)
        contentView.addSubview(nameLabel)
        
    }
}
