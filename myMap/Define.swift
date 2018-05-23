//
//  Define.swift
//  myMap
//
//  Created by Jim Chuang on 2018/3/29.
//  Copyright © 2018年 test. All rights reserved.
//

import Foundation

let cleanLen = 3
var targetComboNumbers:Int = 7

extension Array {
    subscript (safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}

