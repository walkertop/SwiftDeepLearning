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
        testMethodDispatch()
        view.addSubview(configCusomView())
        testGestureAndTouchEvent()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController {
    func testGestureAndTouchEvent() {
        let superButton = UIButton()
        superButton.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        superButton.backgroundColor = .yellow
        view.addSubview(superButton)
        
        let subBtn = UIButton()
        subBtn.addTarget(self, action: #selector(touchBtn), for: .touchUpInside)
        subBtn.frame = CGRect(x: 10, y: 10, width: 50, height: 50)
        subBtn.backgroundColor = .green
        superButton.addSubview(subBtn)
        
        let tap = UISwipeGestureRecognizer(target: self, action: #selector(tapEvent))
        
        subBtn.addGestureRecognizer(tap)
    }
    
    @objc func touchBtn() {
        print("----touchBtn")
        view.backgroundColor = .white
        let templateViewController = TemplateViewController()
        navigationController?.pushViewController(templateViewController, animated: true)
        
    }
    
    @objc func tapEvent() {
        print("----tapEvent")
        view.backgroundColor = .white
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


// MARK: - Method Dispatch函数派发
func testMethodDispatch() {
//    let obj = ClassB()
//    obj.classAFunc()
//    obj.extensionClassAFunc()
//    obj.protocolFunc()
//    obj.finalFunc()
//    
//    let structA = StructA()
//    structA.structAFunc()
//    structA.extensionStructAFunc()
//    
//    let oc = OCClass()
//    oc.OCFunc()
//    oc.test()
}


