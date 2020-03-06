//
//  UIViewController+Extension.swift
//  SwiftTemplate
//
//  Created by 郭彬 on 2020/3/6.
//  Copyright © 2020 walker. All rights reserved.
//
import Foundation
import UIKit

public extension UIViewController {
    
    /// 弹出可以添加内容的自定义弹窗
    /// - Parameters:
    ///   - title:
    ///   - accept: 左边确认文案，默认为 accept
    ///   - cancel: 右边取消文案，默认为 cancel
    ///   - placeholder: 对话框中，默认显示的占位文字
    ///   - callback: escaping callback, 参数为文本内容
    func modalTextAlert(title: String, accept: String = "accept", cancel: String = "cancel", placeholder: String, callback: @escaping (String?) -> ()) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        alert.addTextField { $0.placeholder = placeholder }
        alert.addAction(UIAlertAction(title: cancel, style: .cancel) { _ in
            callback(nil)
        })
        alert.addAction(UIAlertAction(title: accept, style: .default) { _ in
            callback(alert.textFields?.first?.text)
        })
        present(alert, animated: true)
    }
}
