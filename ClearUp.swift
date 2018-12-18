//
//  ClearUp.swift
//  myMap
//
//  Created by Jim Chuang on 2017/9/15.
//  Copyright © 2017年 test. All rights reserved.
//

import Foundation


func clearUp(originalArray: [Array<Int>]) -> [Array<Int>]
{
    var clearUpArray = originalArray
    var fullCondition = true
    for H in 0...4{
        for W in 0...5{

            fullCondition = true

            if W <= (6-cleanLen)
            {
                for x in 0..<cleanLen{
                    if originalArray[H][W] != originalArray[H][W+x]{
                        fullCondition = false
                        break
                    }
                }
                if fullCondition{
                    for x in 0..<cleanLen{
                        clearUpArray[H][W+x] =  CLEAR_UP_BALL_NUMBER
                    }
                }
            }

            fullCondition = true
            if H <= (5-cleanLen)
            {
                for x in 0..<cleanLen{
                    if originalArray[H][W] != originalArray[H+x][W]{
                        fullCondition = false
                        break
                    }
                }
                if fullCondition{
                    for x in 0..<cleanLen{
                        clearUpArray[H+x][W] =  CLEAR_UP_BALL_NUMBER
                    }
                }
            }
        }
    }

    // Sorting Array
    for W in 0...5
    {
        for totalH in 0...3
        {
            for H in 0...3 - totalH
            {
                let H1 = H + 1
                if clearUpArray[H1][W] == CLEAR_UP_BALL_NUMBER
                {
                    swap(&clearUpArray[H][W], &clearUpArray[H1][W])
                }
            }
        }
    }

    //NSLog("clearUpArray = \n\(clearUpArray[0])\n\(clearUpArray[1])\n\(clearUpArray[2])\n\(clearUpArray[3])\n\(clearUpArray[4])")

    return clearUpArray
}
