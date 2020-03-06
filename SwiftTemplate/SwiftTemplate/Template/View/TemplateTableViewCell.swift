//
//  TemplateTableViewCell.swift
//  SwiftDeepLearning
//
//  Created by 郭彬 on 2020/3/6.
//  Copyright © 2020 walker彬. All rights reserved.
//

import UIKit

class TemplateTableViewCell: UITableViewCell {

//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

    var model: TemplateModel? {
        didSet {
            titleLabel.text = model?.title
            introductionLabel.text = model?.introduction
        }
    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    lazy var introductionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.numberOfLines = 0
        return label
    }()
    
    // MARK - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureTableViewCell()
        setupUI()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureTableViewCell() {
        // 选中 状态
        selectionStyle = .none
    }
    
    private func setupUI() {
        titleLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        introductionLabel.frame = CGRect(x: 0, y: 50, width: UIScreen.width, height: 50)
        
        addSubview(titleLabel)
        addSubview(introductionLabel)
    }

}
