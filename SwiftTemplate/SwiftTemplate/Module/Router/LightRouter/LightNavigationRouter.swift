//
//  LightNavigationRouter.swift
//  SwiftTemplate
//
//  Created by 郭彬 on 2020/3/11.
//  Copyright © 2020 walker. All rights reserved.
//

import Foundation
import UIKit

// 定义一个 router
public protocol Navigation {
    
}

class NavigationRouter {
}

public class LightRouter {
    // 通过遵守 isRouter 的协议来暴露方法
    public static let `default`: IsRouter = DefaultRouter()
}

public protocol AppNavigation {
    func viewControllerFor(navigation: Navigation) -> UIViewController
    func navigation(_ navigation: Navigation, from: UIViewController, to: UIViewController)
}

public protocol IsRouter {
    // 核心组件，主要提供几种功能
    
    /// 默认的初始化操作
    func setupAppNavigation(appNavigation: AppNavigation)
    func navigate(_ navigation: Navigation, from: UIViewController)
    func didNavigate(block: @escaping (Navigation) -> Void)
    var appNavigation: AppNavigation? { get }
}

public class DefaultRouter: IsRouter {
    
    public var appNavigation: AppNavigation?
    var didNavigeBlocks = [(Navigation) -> Void]()
    
    public func setupAppNavigation(appNavigation: AppNavigation) {
        self.appNavigation = appNavigation
    }
    
    public func navigate(_ navigation: Navigation, from: UIViewController) {
        // 获取到控制器
        // 定义好跳转
        if let toVC = appNavigation?.viewControllerFor(navigation: navigation) {
            appNavigation?.navigation(navigation, from: from, to: toVC)
            
            for block in didNavigeBlocks {
                block(navigation)
            }
        }
    }
    
    public func didNavigate(block: @escaping (Navigation) -> Void) {
        didNavigeBlocks.append(block)
    }
}


// public 的属性引用必须也是 public 的，不然编译报错，access control 必须不低于才可以
// 可以使用的服务可以直接使用 static let 来处理
// 通过 protocol 来维护暴露的方法


// Usage
public enum MyNavigation: Navigation {
    case template
    case homePage
}

struct MyAppNavigation: AppNavigation {
    func viewControllerFor(navigation: Navigation) -> UIViewController {
        guard let myNavigation = navigation as? MyNavigation else { return UIViewController()}
        switch myNavigation {
            case .template:
                return TemplateViewController()
            case .homePage:
                return HomeController()
        }
    }
    
    func navigation(_ navigation: Navigation, from: UIViewController, to: UIViewController) {
        from.navigationController?.pushViewController(to, animated: true)
    }
}

