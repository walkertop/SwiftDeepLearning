//
//  CustomAlertView1.swift
//  SwiftDeepLearning
//
//  Created by Bin.Guo on 2019/12/2.
//  Copyright © 2019 walker彬. All rights reserved.
//

import UIKit
import SnapKit

protocol CustomAlertView1Delegate: class {
  func closeWindow()
}

class CustomAlertView1: UIView {
  
  weak var delegate: CustomAlertView1Delegate?
  
  private let days: Int
  private let callback: (() -> Void)?
  
  private var daysLbl: UILabel!
  private var textLbl: UILabel!
  
  init(days: Int, action callback: (() -> Void)?) {
    self.days = days
    self.callback = callback
    super.init(frame: .zero)
    setupUI()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func draw(_ rect: CGRect) {
    super.draw(rect)
    textLbl.frame = daysLbl.bounds
  }
}

extension CustomAlertView1 {
  private func setupUI() {
    let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
    visualEffectView.backgroundColor = UIColor.red.withAlphaComponent(0.8)
    self.addSubview(visualEffectView)
    visualEffectView.snp.makeConstraints { make in
      make.top.left.bottom.right.equalToSuperview()
    }
    
    let customAlertBgView: UIView = {
      let bgView = UIView()
      bgView.backgroundColor = UIColor.white
      bgView.layer.cornerRadius = 4.0
      bgView.layer.shadowRadius = 4.0
      bgView.layer.shadowOpacity = 0.1
      bgView.layer.shadowColor = UIColor.darkGray.cgColor
      bgView.layer.shadowOffset = CGSize(width: 0, height: 0)
      return bgView
    }()
    self.addSubview(customAlertBgView)
    customAlertBgView.snp.makeConstraints { make in
      make.height.equalTo(481.0)
      make.width.equalTo(298.0)
      make.center.equalToSuperview()
    }
    
    let bgImageView: UIImageView = {
      let imageView = UIImageView()
      let shapeLayer: CAShapeLayer = {
        let layer = CAShapeLayer()
        let rect = CGRect(x: 0, y: 0, width: 295, height: 395.0)
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: [.topLeft, .topRight],
                                cornerRadii: CGSize(width: 4, height: 4))
        layer.path = path.cgPath
        layer.frame = rect
        return layer
      }()
      imageView.layer.mask = shapeLayer
      imageView.image = UIImage()
      return imageView
    }()
    customAlertBgView.addSubview(bgImageView)
    bgImageView.snp.makeConstraints { make in
      make.top.left.right.equalToSuperview()
      make.height.equalTo(395.0)
    }
    
    let titleLbl: UILabel = {
      let lbl = UILabel()
      lbl.font = UIFont.systemFont(ofSize: 24.0, weight: .regular)
      lbl.textColor = UIColor.red
      lbl.text = "开课倒计时"
      return lbl
    }()
    customAlertBgView.addSubview(titleLbl)
    titleLbl.snp.makeConstraints { make in
      make.top.equalTo(40.0)
      make.centerX.equalToSuperview()
    }
    textLbl = {
      let lbl = UILabel()
      lbl.text = "\(days)"
      lbl.textAlignment = .center
      lbl.font = UIFont.systemFont(ofSize: 180, weight: .black)
      return lbl
    }()
    daysLbl = {
      let lbl = UILabel()
      lbl.text = "\(days)"
      lbl.textColor = .clear
      lbl.textAlignment = .center
      lbl.font = UIFont.systemFont(ofSize: 180, weight: .black)
//      lbl.gradientLayer.colors = [UIColor.vira_yellow.cgColor,
//                                  UIColor(r: 255, g: 247, b: 83).cgColor]
//      lbl.gradientLayer.mask = textLbl.layer
      return lbl
    }()
    customAlertBgView.addSubview(daysLbl)
    daysLbl.snp.makeConstraints { make in
      make.height.equalTo(225.0)
      make.top.equalTo(titleLbl.snp.bottom).offset(12.0)
      make.centerX.equalToSuperview()
    }
    
    let dayFlagLbl: UILabel = {
      let lbl = UILabel()
      lbl.text = "天"
      lbl.textColor = .white
      lbl.font = UIFont.systemFont(ofSize: 18.0, weight: .regular)
      return lbl
    }()
    customAlertBgView.addSubview(dayFlagLbl)
    dayFlagLbl.snp.makeConstraints { make in
      make.left.equalTo(daysLbl.snp.right).offset(8)
      make.top.equalTo(titleLbl.snp.bottom).offset(165.0)
    }
    let subTitleLbl: UILabel = {
      let lbl = UILabel()
      lbl.text = "您已购买了 100 天阅读训练班，目前尚未到开班日期，您可以先阅读免费内容，等开班时间到来，我们将为您开启相应权限"
      lbl.textColor = .white
      lbl.font = UIFont.systemFont(ofSize: 12.0, weight: .regular)
      lbl.textAlignment = .center
      lbl.numberOfLines = 0
      return lbl
    }()
    customAlertBgView.addSubview(subTitleLbl)
    subTitleLbl.snp.makeConstraints { make in
      make.top.equalTo(titleLbl.snp.bottom).offset(231.0)
      make.centerX.equalToSuperview()
      make.left.equalToSuperview().offset(30.0)
      make.right.equalToSuperview().offset(-30.0)
    }
    let btnInsetView = UIView()
    customAlertBgView.addSubview(btnInsetView)
    btnInsetView.snp.makeConstraints { make in
      make.top.equalTo(bgImageView.snp.bottom)
      make.left.bottom.right.equalToSuperview()
    }
    let doneBtn: UIButton = {
      let btn = UIButton()
      btn.backgroundColor = .yellow
      btn.titleLabel?.font = UIFont.systemFont(ofSize: 16.0, weight: .regular)
      btn.setTitle("知道啦", for: .normal)
      btn.setTitleColor(UIColor.darkGray, for: .normal)
      btn.layer.cornerRadius = 22.0
      btn.layer.shadowColor = UIColor.yellow.cgColor
      btn.layer.shadowOffset = CGSize(width: 0, height: 6)
      btn.layer.shadowRadius = 10.0
      btn.layer.shadowOpacity = 0.4
      return btn
    }()
    doneBtn.addTarget(self, action: #selector(closeAction(_:)), for: .touchUpInside)
    btnInsetView.addSubview(doneBtn)
    doneBtn.snp.makeConstraints { make in
      make.width.equalTo(180.0)
      make.height.equalTo(44.0)
      make.center.equalToSuperview()
    }
  }
}

extension CustomAlertView1 {
  @objc func closeAction(_ sender: UIButton) {
    callback?()
    delegate?.closeWindow()
  }
}
