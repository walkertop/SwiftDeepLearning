//
//  CompareProtocol.swift
//  SwiftDeepLearning
//
//  Created by walker彬 on 2017/7/21.
//  Copyright © 2017年 walker彬. All rights reserved.
//

import Foundation

struct Drawable {
    let name: String
    let age: Int
    
    func test() {
        
    }
}

//let drawArray: [Drawable] = (1..<100000000).map{_ in Drawable(name: ..., age: <#Int#>)}

let drawable = Drawable(name: "1", age: 2)
let drawArray: [Drawable] = Array(repeating: drawable, count: 1000)

func compliteTime() {
    print(DispatchTime.now())

    for draw in drawArray {
        draw.test()
    }
    print(DispatchTime.now())
}


