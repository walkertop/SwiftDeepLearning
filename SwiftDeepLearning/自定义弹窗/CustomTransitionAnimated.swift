//
//  CustomTransitionAnimated.swift
//  SwiftDeepLearning
//
//  Created by Bin.Guo on 2019/11/28.
//  Copyright © 2019 walker彬. All rights reserved.
//

import Foundation
import UIKit

public class CustomTransitionAnimated: NSObject, UIViewControllerAnimatedTransitioning {
  
  public var duration = 0.15
  public var backgroundAlpha: CGFloat = 0
  
  public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    return duration
  }
  
  public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    
    if let toVC = transitionContext.viewController(forKey: .to),
      let fromVC = transitionContext.viewController(forKey: .from) {
      
      let isPresenting = toVC.presentingViewController == fromVC
      
      if isPresenting {
        let containerView = transitionContext.containerView
        containerView.addSubview(toVC.view)
        
        toVC.view.backgroundColor = UIColor.black.withAlphaComponent(0)
        UIView.animate(withDuration: duration, animations: {
          toVC.view.backgroundColor = UIColor.black.withAlphaComponent(self.backgroundAlpha)
        }) { _ in
          transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
      } else {
        fromVC.view.backgroundColor = UIColor.black.withAlphaComponent(backgroundAlpha)
        UIView.animate(withDuration: duration, animations: {
          fromVC.view.backgroundColor = UIColor.black.withAlphaComponent(0)
        }) { _ in
          fromVC.view.removeFromSuperview()
          transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
      }
    }
  }
}
