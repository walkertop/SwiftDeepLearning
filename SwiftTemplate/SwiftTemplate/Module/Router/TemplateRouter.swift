//
//  TemplateRouter.swift
//  SwiftTemplate
//
//  Created by 郭彬 on 2020/3/11.
//  Copyright © 2020 walker. All rights reserved.
//

import Foundation



public typealias APPRouterType = ([AnyHashable: Any]?) -> Void

public protocol APPRouterProtocol {
    func router()
    func router(_ param: [AnyHashable: Any]?, callback: APPRouterType?)
}

extension APPRouterProtocol {
    func router() {
        router(nil, callback: nil)
    }
    
    func router(_ param: [AnyHashable: Any]?, callback: (([AnyHashable: Any]?) -> Void)?) {
        
    }

}

public class APPRouter {
    public static let shared = APPRouter()
    private init() {}
    
    public var routerHandler:((_ router: APPRouterProtocol,
                               _ parameter:[AnyHashable: Any]?,
    _ callback:(([AnyHashable:Any]?)->Void)?)->Void)?
}

enum Router: APPRouterProtocol {
    // 根据功能细分
    case HTTPRouter(url: String)
    case NativeRouter(page: NativeBussiness)
    case FlutterRouter(moduleName: String, page: String)
    
    enum NativeBussiness: APPRouterProtocol {
        case book
        case shop
        case profile
    }
}

// 统一配置路由
func setupRouterConfigration() {
    APPRouter.shared.routerHandler = { (router, parameter, callback) in
        switch router {
            case Router.FlutterRouter(let moduleName, let page):
                print("module == \(moduleName), page = \(page)")
            case Router.HTTPRouter(let url):
                print("url == \(url)")
            case Router.NativeBussiness.book:
                print("book")
            case Router.NativeBussiness.shop:
                print("shop")
            case Router.NativeBussiness.profile:
                print("profile")
            default:
                print("default")
        }
    }

}

func excuteRouter() {
    Router.FlutterRouter(moduleName: "home", page: "learn").router(["id":123]) { param in
        guard let p = param else { return }
        print(p)
    }
}
