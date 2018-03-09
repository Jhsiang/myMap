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
    
    
    
    for count in 0...29
    {
        let H :Int = count/6 // H = 0 to 4
        let W :Int = count%6 // W = 0 to 5
        
        let H1:Int = H+1
        let H2:Int = H+2
        
        let W1:Int = W+1
        let W2:Int = W+2
        
        if W <= 3
        {
            if originalArray[H][W] == originalArray[H][W1] && originalArray[H][W] == originalArray[H][W2]
            {
                clearUpArray[H][W] =  7
                clearUpArray[H][W1] = 7
                clearUpArray[H][W2] = 7
            }
        }
        
        if H <= 2
        {
            if originalArray[H][W] == originalArray[H1][W] && originalArray[H][W] == originalArray[H2][W]
            {
                clearUpArray[H][W] = 7
                clearUpArray[H1][W] = 7
                clearUpArray[H2][W] = 7
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
                if clearUpArray[H1][W] == 7
                {
                    swap(&clearUpArray[H][W], &clearUpArray[H1][W])
                }
            }
        }
    }
    
    //NSLog("clearUpArray = \n\(clearUpArray[0])\n\(clearUpArray[1])\n\(clearUpArray[2])\n\(clearUpArray[3])\n\(clearUpArray[4])")
    
    
    return clearUpArray
}
