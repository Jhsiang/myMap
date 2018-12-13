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
    ) -> (resultArr:[Array<Int>],routeSave:Array<Any>,nowLoc:Int)
{

    var resultArr = originalArray
    var nowLoc = startLocation
    var directRnd:Int = DOWN
    var reverseDirectRnd:Int? = nil // copy from directRnd
    var directArray:Array = [DOWN,UP,LEFT,RIGHT]

    let step = Int.random(in: stepFrom...stepTo)
    var routeSave = Array<Int>()

    for _ in 1...step
    {
        directArray = directArray.filter{ $0 != reverseDirectRnd}
        if nowLoc / 6 == 4{
            directArray = directArray.filter{ $0 != DOWN}
        }
        if nowLoc % 6 == 0{
            directArray = directArray.filter{ $0 != LEFT}
        }
        if nowLoc % 6 == 5{
            directArray = directArray.filter{ $0 != RIGHT}
        }
        if nowLoc / 6 == 0{
            directArray = directArray.filter{ $0 != UP}
        }
        directRnd = directArray.randomElement()!
        reverseDirectRnd = -directRnd
        routeSave.append(directRnd)
        nowLoc += directRnd
        directArray = [DOWN,UP,LEFT,RIGHT]
    }

    nowLoc = startLocation
    var nowH:Int
    var nextH:Int
    var nowW:Int
    var nextW:Int
    var nextLoc:Int

    for dir in routeSave
    {
        nowH = nowLoc / 6
        nowW = nowLoc % 6

        nextLoc = dir + nowLoc
        nextH = nextLoc/6
        nextW = nextLoc%6

        swap(&resultArr[nowH][nowW], &resultArr[nextH][nextW])
        nowLoc = nextLoc
    }


    return(resultArr,routeSave,nowLoc)
}

