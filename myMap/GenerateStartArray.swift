//
//  GenerateStartArray.swift
//  myMap
//
//  Created by Jim Chuang on 2018/5/23.
//  Copyright © 2018年 test. All rights reserved.
//

import Foundation

func genStartArr(noComboArr:Bool) -> [Array<Int>]
{
    let wArr = Array(repeating: 0, count: 6)
    var resultArr = Array(repeating: wArr, count: 5)
    NSLog("self.original Array1 = \n\(resultArr[0])\n\(resultArr[1])\n\(resultArr[2])\n\(resultArr[3])\n\(resultArr[4])")
    var hasCombo = false
    repeat
    {
        hasCombo = false
        for arrayHeight in 0...4
        {
            let arrayHeightMinus1 = arrayHeight - 1
            let arrayHeightMinus2 = arrayHeight - 2
            for arrayWidth in 0...5
            {
                resultArr[arrayHeight][arrayWidth] = Int(arc4random_uniform(6))
                let arrayWidthMinus1 = arrayWidth - 1
                let arrayWidthMinus2 = arrayWidth - 2

                if arrayWidth >= 2
                {
                    if resultArr[arrayHeight][arrayWidth] == resultArr[arrayHeight][arrayWidthMinus1] && resultArr[arrayHeight][arrayWidth] == resultArr[arrayHeight][arrayWidthMinus2]
                    {
                        //NSLog("width + 1")
                        hasCombo = true
                    }
                }
                if arrayHeight >= 2
                {
                    if resultArr[arrayHeight][arrayWidth] == resultArr[arrayHeightMinus1][arrayWidth] && resultArr[arrayHeight][arrayWidth] == resultArr[arrayHeightMinus2][arrayWidth]
                    {
                        //NSLog("height + 1")
                        hasCombo = true
                    }
                }
            }
        }
    } while hasCombo == noComboArr

    return resultArr
}
