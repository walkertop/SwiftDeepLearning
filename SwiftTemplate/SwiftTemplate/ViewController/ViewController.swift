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
    setupUI()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  private func setupUI() {
    self.customButton.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
    view.addSubview(self.customButton)
    
  }
  lazy var customButton: UIButton = {
    let btn = UIButton(type: .custom)
    btn.setTitle("打开TableView", for: .normal)
    btn.setTitleColor(UIColor.blue, for: .normal)
    btn.backgroundColor = .white
    btn.addTarget(self, action: #selector(openTestTableViewController), for: .touchUpInside)
    return btn
  }()
  
  @IBAction func openTestTableViewController(_ sender: AnyObject) {
//    let tableViewVC = BaseTableTableViewController()
//    self.present(tableViewVC, animated: true, completion: nil)
//    let alertViewController = CustomAlertViewController(type: .customView(3, {
//      print("debug-vira-log")
//    }))
//
//    self.present(alertViewController, animated: true, completion: nil)
    let templateViewController = TemplateViewController()
       navigationController?.pushViewController(templateViewController, animated: true)
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
  
  let man = Human(height: 1.9, color: UIColor.white)
  let isTall = man.isTall(height: man.height)
  print(isTall)
}

protocol ColorfulLifeProtocol {
  func isTall(height: Float)->Bool
  func isWhite(color: UIColor)->Bool
}

extension ColorfulLifeProtocol {
  func isTall(height: Float)->Bool {
    return height > 1.8
  }
  func isWhite(color: UIColor)->Bool {
    return color .isEqual(UIColor.white)
  }
}

struct Human: ColorfulLifeProtocol {
  let height: Float
  let color: UIColor
  //  func isTall(height: Float) -> Bool {
  //    return self.height > 1.8
  //  }
}
