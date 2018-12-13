//
//  RotArr.swift
//  myMap
//
//  Created by Jim Chuang on 2018/12/12.
//  Copyright © 2018 test. All rights reserved.
//

import Foundation

class RotArr{

    static let share = RotArr(arr: [[2, 3, 1, 5, 3, 4],
                                    [5, 2, 4, 3, 2, 2],
                                    [4, 5, 4, 3, 5, 1],
                                    [0, 3, 0, 4, 4, 3],
                                    [5, 4, 3, 1, 0, 3]])

    private var rotArr = Array<Array<Int>>()

    init(arr:Array<Array<Int>>) {
        rotArr = arr
    }

    func showCombo() -> Int{
        return comboCal(comboArray: rotArr)
    }

    func rotation(){
        let aa = startRotation(originalArray: rotArr, startLocation: 0, stepFrom: 9, stepTo: 9)
        rotArr = aa.resultArr
    }


}
