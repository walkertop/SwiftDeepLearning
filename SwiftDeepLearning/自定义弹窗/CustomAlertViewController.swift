//
//  CustomAlertViewController.swift
//  SwiftDeepLearning
//
//  Created by Bin.Guo on 2019/11/28.
//  Copyright © 2019 walker彬. All rights reserved.
//

import UIKit
import QuartzCore
import SnapKit

public class CustomAlertViewController: UIViewController {
  
  public enum ContentAnimation: Int {
    case slidingBottomToTop
    
    case none
    
    var animationName: String {
      switch self {
      case .slidingBottomToTop:
        return "slidingBottomToTop"
      case .none:
        return ""
      }
    }
  }
  
  public enum LayoutType: Int {
    /// 全屏
    case fullScreen
    
    case none
  }
  
  public enum ContentType {
    /// 开课倒计时
    case customView(Int, (() -> Void)?)
  }
  
  public var viewWillAppearCallback: (() -> Void)?
  public var viewDidAppearCallback: (() -> Void)?
  public var viewDidLoadCallback: (() -> Void)?
  
  private let contentView: UIView
  private let tAnimation = CustomTransitionAnimated()
  private let transitionAnimation: ContentAnimation
  private var layout: LayoutType
  
  public init(contentView: UIView,
              backgroundAlpha: CGFloat = 0.7,
              transitionAnimation: ContentAnimation = .none,
              layout: LayoutType = .none) {
    self.contentView = contentView
    self.tAnimation.backgroundAlpha = backgroundAlpha
    self.transitionAnimation = transitionAnimation
    self.layout = layout
    super.init(nibName: nil, bundle: nil)
    setupUI()
  }
  
  public init(type: ContentType) {
    switch type {
    case .customView(let days, let callback):
      let customView = CustomAlertView1(days: days, action: callback)
      self.contentView = customView
      tAnimation.backgroundAlpha = 0
      self.layout = .none
    }
    self.layout = .fullScreen
    self.transitionAnimation = .none
    super.init(nibName: nil, bundle: nil)
    if let customView = self.contentView as? CustomAlertView1 {
      customView.delegate = self
    }

    setupUI()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public override func viewDidLoad() {
    super.viewDidLoad()
    
    self.transitioningDelegate = self
    
    self.view.addSubview(contentView)
    switch layout {
    case .fullScreen:
      contentView.snp.makeConstraints { make in
        make.top.left.bottom.right.equalToSuperview()
      }
      break
    case .none:
      break
    }
    
    viewDidLoadCallback?()
  }
  
  override public func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    viewWillAppearCallback?()
    
    switch transitionAnimation {
    case .slidingBottomToTop:
      let position = contentView.layer.position
      let animation = CABasicAnimation(keyPath: "position.y")
      animation.fromValue = 2 * position.y
      animation.toValue = position.y
      animation.duration = tAnimation.duration
      animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
      contentView.layer.add(animation, forKey: transitionAnimation.animationName)
    case .none:
      break
    }
  }
  
  override public func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    viewDidAppearCallback?()
  }
  
  override public func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
    super.dismiss(animated: flag, completion: completion)
    switch transitionAnimation {
    case .slidingBottomToTop:
      let position = contentView.layer.position
      let animation = CABasicAnimation(keyPath: "position.y")
      animation.fromValue = position.y
      animation.toValue = 2 * position.y
      animation.duration = tAnimation.duration
//      animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
      animation.isRemovedOnCompletion = false
//      animation.fillMode  = .forwards
      contentView.layer.add(animation, forKey: "dismiss")
    case .none:
      break
    }
  }
    
    private func setupUI() {
      self.view.backgroundColor = .clear
      self.definesPresentationContext = true
      self.providesPresentationContextTransitionStyle = true
      self.modalTransitionStyle = .crossDissolve
      self.modalPresentationStyle = .overFullScreen
    }
}


/// 某一个弹窗的功能
protocol CountdownViewDelegate: class {
  func closeWindow()
}

// MARK: - CountdownViewDelegate
extension CustomAlertViewController: CustomAlertView1Delegate {
  func closeWindow() {
    self.dismiss(animated: true, completion: nil)
  }
}


// MARK: - UIViewControllerTransitioningDelegate
extension CustomAlertViewController: UIViewControllerTransitioningDelegate {
  
  public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return tAnimation
  }
  
  public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return tAnimation
  }
}

