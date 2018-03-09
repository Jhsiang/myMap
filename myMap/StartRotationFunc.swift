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
    //var aaa = originalArray
    var rotationArray = originalArray
    //NSLog("rotationArray1 = \n\(rotationArray[0])\n\(rotationArray[1])\n\(rotationArray[2])\n\(rotationArray[3])\n\(rotationArray[4])")
    
    //let startLocation = Int(arc4random_uniform(30))
    
    var nowLocation = startLocation
    
    var directRnd:Int = Int(arc4random_uniform(3))
    var repeatDirectRnd:Int = 8
    let directArray:Array = [-6,6,-1,1]
    
    let calFrom = stepFrom - 1
    let calTo = uint(stepTo - calFrom)
    let step = Int(arc4random_uniform(calTo)) + (calFrom)
    
    var routeSave = Array(repeating: 0, count: step+1)
    
    
    let date = Date()
    let calendar = Calendar.current
    let hour = calendar.component(.hour, from: date)
    let minutes = calendar.component(.minute, from: date)
    let seconds = calendar.component(.second, from: date)
    let nseconds = calendar.component(.nanosecond, from: date)
    
    //NSLog("s=\(seconds)ns = \(nseconds) ss")
    for x in 0...step
    {
        repeat
        {
            directRnd = Int(arc4random_uniform(4))
        } while (((nowLocation == 0  || nowLocation == 1  || nowLocation == 2  || nowLocation == 3  || nowLocation == 4  || nowLocation == 5)  && (directRnd == 0)) ||
                 ((nowLocation == 24 || nowLocation == 25 || nowLocation == 26 || nowLocation == 27 || nowLocation == 28 || nowLocation == 29) && (directRnd == 1)) ||
                 ((nowLocation == 0  || nowLocation == 6  || nowLocation == 12 || nowLocation == 18 || nowLocation == 24)                      && (directRnd == 2)) ||
                 ((nowLocation == 5  || nowLocation == 11 || nowLocation == 17 || nowLocation == 23 || nowLocation == 29)                      && (directRnd == 3)) ||
                 (repeatDirectRnd == 0 && directRnd == 1) || (repeatDirectRnd == 1 && directRnd == 0) ||
                 (repeatDirectRnd == 2 && directRnd == 3) || (repeatDirectRnd == 3 && directRnd == 2))
        
        repeatDirectRnd = directRnd
        routeSave[x] = directArray[directRnd]
        nowLocation += routeSave[x]
    }

    nowLocation = startLocation
    var nowH:Int
    var nextH:Int
    var nowW:Int
    var nextW:Int
    
    for x in 0...step
    {
        nowH = nowLocation/6 //H=0~4
        nowW = nowLocation%6 //W=0~5
        nextH = (routeSave[x]+nowLocation)/6
        nextW = (routeSave[x]+nowLocation)%6
        //NSLog("nowLocation = \(nowLocation) routeSave = \(routeSave)")
        //NSLog("nowH = \(nowH) nowW = \(nowW) nextH = \(nextH) nextW = \(nextW)")
        swap(&rotationArray[nowH][nowW], &rotationArray[nextH][nextW])
        nowLocation += routeSave[x]
    }
    
    //NSLog("rotationArray2 = \n\(rotationArray[0])\n\(rotationArray[1])\n\(rotationArray[2])\n\(rotationArray[3])\n\(rotationArray[4])")

    return (rotationArray,routeSave,nowLocation)
}
