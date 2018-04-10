//
//  StartRotationFunc.swift
//  myMap
//
//  Created by Jim Chuang on 2017/9/14.
//  Copyright © 2017年 test. All rights reserved.
//

import Foundation

//var stepFrom:Int = 5
//var stepTo:Int = 7

func startRotation(originalArray: [Array<Int>],
                   startLocation: Int,
                   stepFrom: Int,
                   stepTo: Int
                   ) -> ([Array<Int>],Array<Any>,Int)
{
    var rotationA = originalArray
    var nowLoc = startLocation
    var directRnd:Int = 3 //must to be 0~3
    var repeatDirectRnd:Int = 8 // copy from directRnd
    var directArray:Array = [-6,6,-1,1]

    let rndMin = stepFrom - 1
    let rndMax = uint(stepTo - rndMin)
    let step = Int(arc4random_uniform(rndMax)) + rndMin //step from min to max
    var routeSave = Array(repeatElement(0, count: step+1))

    for x in 0...step
    {
        directArray = directArray.filter{ $0 != -repeatDirectRnd}
        if nowLoc / 6 == 4{
            directArray = directArray.filter{ $0 != 6}
        }
        if nowLoc % 6 == 0{
            directArray = directArray.filter{ $0 != -1}
        }
        if nowLoc % 6 == 5{
            directArray = directArray.filter{ $0 != 1}
        }
        if nowLoc / 6 == 0{
            directArray = directArray.filter{ $0 != -6}
        }
        directRnd = Int(arc4random_uniform(UInt32(directArray.count)))
        repeatDirectRnd = directArray[directRnd]
        routeSave[x] = directArray[directRnd]
        nowLoc += routeSave[x]
        directArray = [-6,6,-1,1]
    }

    nowLoc = startLocation
    var nowH:Int
    var nextH:Int
    var nowW:Int
    var nextW:Int
    var nextLoc:Int

    for x in 0...step
    {
        nowH = nowLoc / 6
        nowW = nowLoc % 6
        nextLoc = routeSave[x] + nowLoc
        nextH = nextLoc/6
        nextW = nextLoc%6
        swap(&rotationA[nowH][nowW], &rotationA[nextH][nextW])
        nowLoc = nextLoc
    }

    return(rotationA,routeSave,nowLoc)
}
