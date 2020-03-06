//
//  UIScreen+Extension.swift
//  SwiftDeepLearning
//
//  Created by 郭彬 on 2020/3/6.
//  Copyright © 2020 walker彬. All rights reserved.
//

import Foundation
import UIKit

public extension UIScreen {
    static var height: CGFloat {
        return main.bounds.height
    }
    static var width: CGFloat {
        return main.bounds.width
    }
    
    // 判断是否是全面屏
    static var isFullScreen: Bool {
        if #available(iOS 11, *) {
            guard let window = UIApplication.shared.delegate?.window, let unwrapedWindow = window else {
                return false
            }
            if unwrapedWindow.safeAreaInsets.left > 0 || unwrapedWindow.safeAreaInsets.bottom > 0 {
                print(unwrapedWindow.safeAreaInsets)
                return true
            }
        }
        return false
    }
}



