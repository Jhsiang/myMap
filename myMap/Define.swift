//
//  Define.swift
//  myMap
//
//  Created by Jim Chuang on 2018/3/29.
//  Copyright © 2018年 test. All rights reserved.
//

import Foundation

let UP = -6
let LEFT = -1
let RIGHT = 1
let DOWN = 6

let cleanLen = 3
let TARGET_COMBO_NUMBERS:Int = 6
let MAX_TOTAL_STEP:Int = 30

extension Array {
    subscript (safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}

func DLog<T> (message: T, fileName: String = #file, funcName: String = #function, lineNum: Int = #line) {

    #if DEBUG

    let file = (fileName as NSString).lastPathComponent

    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSSS"
    let sendDate = Date()
    let timeStr = dateFormatter.string(from: sendDate)

    //print("\(timeStr) \(file) \(funcName)-[\(lineNum)]: \(message)")

    #endif

}
