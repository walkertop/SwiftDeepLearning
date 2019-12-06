//
//  UIView+Extension.swift
//  SwiftDeepLearning
//
//  Created by walker彬 on 2017/7/27.
//  Copyright © 2017年 walker彬. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
  
  func with(frame: CGRect) -> Self {
    self.frame = frame
    return self
  }
  
  func with(backgroundColor: UIColor) -> Self {
    self.backgroundColor = backgroundColor
    return self
  }
  
  func with(OfLayer cornerRadius: CGFloat) -> Self {
    self.layer.cornerRadius = cornerRadius
    return self
  }
  func with(alpha: CGFloat) -> Self {
    self.alpha = alpha
    return self
  }
  
  func with(contentMode: UIView.ContentMode) -> Self {
    self.contentMode = contentMode
    return self
  }
  
  func with(isHidden: Bool) -> Self {
    self.isHidden = isHidden
    return self
  }
}
