//
//  ViewController.swift
//  SwiftDeepLearning
//
//  Created by walker彬 on 2017/7/12.
//  Copyright © 2017年 walker彬. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        compliteTime()
        view.backgroundColor = #colorLiteral(red: 0.9751198888, green: 0.257982105, blue: 0.04290816933, alpha: 1)
        let sel1 = #selector(viewDidLoad)
        let imp1 = method(for: #selector(ViewController.viewDidLoad))
        print("111函数指针是\(imp1!),\(sel1)")
//        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (timer) in
//            let secondVc = secondViewController()
//            self.present(secondVc, animated: true) {
//            }
//        }
        
        view.addSubview(configCusomView())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    }
}


func configCusomView() -> UIView{
    let customView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 200, height: 200))
        .with(backgroundColor: .brown)
        .with(alpha: 0.5)
    return customView
}


// MARK: - 另一个控制器
class secondViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.yellow
        let imp2 = method(for: #selector(secondViewController.viewDidLoad))
        let sel2 = #selector(viewDidLoad)
        print("22222函数指针是\(imp2!),\(sel2)")
    }
}

