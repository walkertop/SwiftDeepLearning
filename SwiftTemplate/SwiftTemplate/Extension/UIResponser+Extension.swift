//
//  UIResponser+Extension.swift
//  SwiftDeepLearning
//
//  Created by 郭彬 on 2020/3/6.
//  Copyright © 2020 walker彬. All rights reserved.
//

import Foundation
import UIKit

public extension UIResponder {
    static var identifier: String {
      return String(describing: self)
    }
}
