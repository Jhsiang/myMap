//
//  ComboCalFunc.swift
//  myMap
//
//  Created by Jim Chuang on 2017/9/14.
//  Copyright © 2017年 test. All rights reserved.
//

import Foundation



func comboCal (comboArray: [Array<Int>]) -> Int
{
    var newCombo2Array:Array = comboArray
    var originalComboArray:Array = comboArray
    
    var totalCombo:Int = 0
    var combo:Int = 0
    
    repeat
    {
        combo = 0
        
        for count in 0...29
        {
            let H :Int = count/6 // H = 0 to 4
            let W :Int = count%6 // W = 0 to 5
            
            let H1:Int = H+1
            let H2:Int = H+2
            let H3:Int = H+3
            let H4:Int = H+4
            
            let W1:Int = W+1
            let W2:Int = W+2
            let W3:Int = W+3
            
            let beforeW1:Int = W-1
            let beforeW2:Int = W-2
            let beforeW3:Int = W-3
            let beforeW4:Int = W-4
            let beforeW5:Int = W-5
            
            switch originalComboArray[H][W] {
            case 0:
                // Check width
                if W <= 3
                {
                    if originalComboArray[H][W] == originalComboArray[H][W1] && originalComboArray[H][W] == originalComboArray[H][W2] && originalComboArray[H][W] != 6
                    {
                        if newCombo2Array[H][W] != 6 && newCombo2Array[H][W1] != 6 && newCombo2Array[H][W2] != 6
                        {
                            combo += 1
                            //NSLog("[\(H)][\(W)]")
                        }
                        
                        newCombo2Array[H][W] = 6
                        newCombo2Array[H][W1] = 6
                        newCombo2Array[H][W2] = 6
                        
                        if H <= 3
                        {
                            newCombo2Array[H1][W] = originalComboArray[H1][W] == 0 ? 6 : newCombo2Array[H1][W]
                            newCombo2Array[H1][W1] = originalComboArray[H1][W1] == 0 ? 6 : newCombo2Array[H1][W1]
                            newCombo2Array[H1][W2] = originalComboArray[H1][W2] == 0 ? 6 : newCombo2Array[H1][W2]
                        }
                        if W <= 2
                        {
                            newCombo2Array[H][W3] = originalComboArray[H][W3] == 0 ? 6 : newCombo2Array[H][W3]
                        }
                    }
                }
                // Check height
                if H <= 2
                {
                    if originalComboArray[H][W] == originalComboArray[H1][W] && originalComboArray[H][W] == originalComboArray[H2][W] && originalComboArray[H][W] != 6
                    {
                        if newCombo2Array[H][W] != 6 && newCombo2Array[H1][W] != 6 && newCombo2Array[H2][W] != 6
                        {
                            combo += 1
                            //NSLog("[\(H)][\(W)]")
                        }
                        
                        newCombo2Array[H][W] = 6
                        newCombo2Array[H1][W] = 6
                        newCombo2Array[H2][W] = 6
                        
                        if W <= 4
                        {
                            newCombo2Array[H][W1] = originalComboArray[H][W1] == 0 ? 6 : newCombo2Array[H][W1]
                            newCombo2Array[H1][W1] = originalComboArray[H1][W1] == 0 ? 6 : newCombo2Array[H1][W1]
                            newCombo2Array[H2][W1] = originalComboArray[H2][W1] == 0 ? 6 : newCombo2Array[H2][W1]
                        }
                        switch W {
                        case 1:
                            // beforeW1
                            newCombo2Array[H1][beforeW1] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW1]
                            newCombo2Array[H2][beforeW1] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW1]
                        case 2:
                            // beforeW1
                            newCombo2Array[H1][beforeW1] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW1]
                            newCombo2Array[H2][beforeW1] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW1]
                            // beforeW2
                            newCombo2Array[H1][beforeW2] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW2]
                            newCombo2Array[H2][beforeW2] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW2]
                        case 3:
                            // beforeW1
                            newCombo2Array[H1][beforeW1] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW1]
                            newCombo2Array[H2][beforeW1] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW1]
                            // beforeW2
                            newCombo2Array[H1][beforeW2] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW2]
                            newCombo2Array[H2][beforeW2] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW2]
                            // beforeW3
                            newCombo2Array[H1][beforeW3] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW3]
                            newCombo2Array[H2][beforeW3] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW3]
                        case 4:
                            // beforeW1
                            newCombo2Array[H1][beforeW1] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW1]
                            newCombo2Array[H2][beforeW1] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW1]
                            // beforeW2
                            newCombo2Array[H1][beforeW2] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW2]
                            newCombo2Array[H2][beforeW2] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW2]
                            // beforeW3
                            newCombo2Array[H1][beforeW3] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW3]
                            newCombo2Array[H2][beforeW3] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW3]
                            // beforeW4
                            newCombo2Array[H1][beforeW4] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW3] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW4] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW4]
                            newCombo2Array[H2][beforeW4] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW3] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW4] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW4]
                        case 5:
                            // beforeW1
                            newCombo2Array[H1][beforeW1] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW1]
                            newCombo2Array[H2][beforeW1] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW1]
                            // beforeW2
                            newCombo2Array[H1][beforeW2] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW2]
                            newCombo2Array[H2][beforeW2] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW2]
                            // beforeW3
                            newCombo2Array[H1][beforeW3] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW3]
                            newCombo2Array[H2][beforeW3] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW3]
                            // beforeW4
                            newCombo2Array[H1][beforeW4] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW3] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW4] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW4]
                            newCombo2Array[H2][beforeW4] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW3] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW4] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW4]
                            // beforeW5
                            newCombo2Array[H1][beforeW5] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW3] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW5] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW5] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW5]
                            newCombo2Array[H2][beforeW5] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW3] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW4] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW5] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW5]
                        default:
                            break
                        }
                        
                        if H == 0 && originalComboArray[H3][W] == originalComboArray[H][W]
                        {
                            newCombo2Array[H3][W] = 6
                            switch W {
                            case 1:
                                // beforeW1
                                newCombo2Array[H3][beforeW1] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW1]
                            case 2:
                                // beforeW1
                                newCombo2Array[H3][beforeW1] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW1]
                                // beforeW2
                                newCombo2Array[H3][beforeW2] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW2]
                            case 3:
                                // beforeW1
                                newCombo2Array[H3][beforeW1] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW1]
                                // beforeW2
                                newCombo2Array[H3][beforeW2] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW2]
                                // beforeW3
                                newCombo2Array[H3][beforeW3] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW3]
                            case 4:
                                // beforeW1
                                newCombo2Array[H3][beforeW1] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW1]
                                // beforeW2
                                newCombo2Array[H3][beforeW2] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW2]
                                // beforeW3
                                newCombo2Array[H3][beforeW3] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW3]
                                // beforeW4
                                newCombo2Array[H3][beforeW4] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW4] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW4]
                            case 5:
                                // beforeW1
                                newCombo2Array[H3][beforeW1] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW1]
                                // beforeW2
                                newCombo2Array[H3][beforeW2] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW2]
                                // beforeW3
                                newCombo2Array[H3][beforeW3] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW3]
                                // beforeW4
                                newCombo2Array[H3][beforeW4] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW4] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW4]
                                // beforeW5
                                newCombo2Array[H3][beforeW5] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW4] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW5] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW5]
                            default:
                                break
                            }
                        }
                        
                        if H == 0 && originalComboArray[H3][W] == originalComboArray[H][W] && originalComboArray[H4][W] == originalComboArray[H][W]
                        {
                            newCombo2Array[H4][W] = 6
                            switch W {
                            case 1:
                                // beforeW1
                                newCombo2Array[H4][beforeW1] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW1]
                            case 2:
                                // beforeW1
                                newCombo2Array[H4][beforeW1] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW1]
                                // beforeW2
                                newCombo2Array[H4][beforeW2] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW2]
                            case 3:
                                // beforeW1
                                newCombo2Array[H4][beforeW1] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW1]
                                // beforeW2
                                newCombo2Array[H4][beforeW2] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW2]
                                // beforeW3
                                newCombo2Array[H4][beforeW3] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW3]
                            case 4:
                                // beforeW1
                                newCombo2Array[H4][beforeW1] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW1]
                                // beforeW2
                                newCombo2Array[H4][beforeW2] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW2]
                                // beforeW3
                                newCombo2Array[H4][beforeW3] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW3]
                                // beforeW4
                                newCombo2Array[H4][beforeW4] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW3] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW4] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW4]
                            case 5:
                                // beforeW1
                                newCombo2Array[H4][beforeW1] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW1]
                                // beforeW2
                                newCombo2Array[H4][beforeW2] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW2]
                                // beforeW3
                                newCombo2Array[H4][beforeW3] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW3]
                                // beforeW4
                                newCombo2Array[H4][beforeW4] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW3] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW4] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW4]
                                // beforeW5
                                newCombo2Array[H4][beforeW5] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW3] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW4] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW5] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW5]
                            default:
                                break
                            }
                        }
                        
                        if H == 1 && originalComboArray[H3][W] == originalComboArray[H][W]
                        {
                            newCombo2Array[H3][W] = 6
                            switch W {
                            case 1:
                                // beforeW1
                                newCombo2Array[H3][beforeW1] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW1]
                            case 2:
                                // beforeW1
                                newCombo2Array[H3][beforeW1] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW1]
                                // beforeW2
                                newCombo2Array[H3][beforeW2] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW2]
                            case 3:
                                // beforeW1
                                newCombo2Array[H3][beforeW1] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW1]
                                // beforeW2
                                newCombo2Array[H3][beforeW2] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW2]
                                // beforeW3
                                newCombo2Array[H3][beforeW3] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW3]
                            case 4:
                                // beforeW1
                                newCombo2Array[H3][beforeW1] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW1]
                                // beforeW2
                                newCombo2Array[H3][beforeW2] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW2]
                                // beforeW3
                                newCombo2Array[H3][beforeW3] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW3]
                                // beforeW4
                                newCombo2Array[H3][beforeW4] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW4] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW4]
                            case 5:
                                // beforeW1
                                newCombo2Array[H3][beforeW1] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW1]
                                // beforeW2
                                newCombo2Array[H3][beforeW2] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW2]
                                // beforeW3
                                newCombo2Array[H3][beforeW3] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW3]
                                // beforeW4
                                newCombo2Array[H3][beforeW4] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW4] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW4]
                                // beforeW5
                                newCombo2Array[H3][beforeW5] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW4] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW5] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW5]
                            default:
                                break
                            }
                        }
                    }
                }
            case 1:
                // Check width
                if W <= 3
                {
                    if originalComboArray[H][W] == originalComboArray[H][W1] && originalComboArray[H][W] == originalComboArray[H][W2] && originalComboArray[H][W] != 6
                    {
                        if newCombo2Array[H][W] != 6 && newCombo2Array[H][W1] != 6 && newCombo2Array[H][W2] != 6
                        {
                            combo += 1
                            //NSLog("[\(H)][\(W)]")
                        }
                        
                        newCombo2Array[H][W] = 6
                        newCombo2Array[H][W1] = 6
                        newCombo2Array[H][W2] = 6
                        
                        if H <= 3
                        {
                            newCombo2Array[H1][W] = originalComboArray[H1][W] == 1 ? 6 : newCombo2Array[H1][W]
                            newCombo2Array[H1][W1] = originalComboArray[H1][W1] == 1 ? 6 : newCombo2Array[H1][W1]
                            newCombo2Array[H1][W2] = originalComboArray[H1][W2] == 1 ? 6 : newCombo2Array[H1][W2]
                        }
                        if W <= 2
                        {
                            newCombo2Array[H][W3] = originalComboArray[H][W3] == 1 ? 6 : newCombo2Array[H][W3]
                        }
                    }
                }
                // Check height
                if H <= 2
                {
                    if originalComboArray[H][W] == originalComboArray[H1][W] && originalComboArray[H][W] == originalComboArray[H2][W] && originalComboArray[H][W] != 6
                    {
                        if newCombo2Array[H][W] != 6 && newCombo2Array[H1][W] != 6 && newCombo2Array[H2][W] != 6
                        {
                            combo += 1
                            //NSLog("[\(H)][\(W)]")
                        }
                        
                        newCombo2Array[H][W] = 6
                        newCombo2Array[H1][W] = 6
                        newCombo2Array[H2][W] = 6
                        
                        if W <= 4
                        {
                            newCombo2Array[H][W1] = originalComboArray[H][W1] == 1 ? 6 : newCombo2Array[H][W1]
                            newCombo2Array[H1][W1] = originalComboArray[H1][W1] == 1 ? 6 : newCombo2Array[H1][W1]
                            newCombo2Array[H2][W1] = originalComboArray[H2][W1] == 1 ? 6 : newCombo2Array[H2][W1]
                        }
                        switch W {
                        case 1:
                            // beforeW1
                            newCombo2Array[H1][beforeW1] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW1]
                            newCombo2Array[H2][beforeW1] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW1]
                        case 2:
                            // beforeW1
                            newCombo2Array[H1][beforeW1] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW1]
                            newCombo2Array[H2][beforeW1] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW1]
                            // beforeW2
                            newCombo2Array[H1][beforeW2] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW2]
                            newCombo2Array[H2][beforeW2] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW2]
                        case 3:
                            // beforeW1
                            newCombo2Array[H1][beforeW1] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW1]
                            newCombo2Array[H2][beforeW1] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW1]
                            // beforeW2
                            newCombo2Array[H1][beforeW2] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW2]
                            newCombo2Array[H2][beforeW2] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW2]
                            // beforeW3
                            newCombo2Array[H1][beforeW3] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW3]
                            newCombo2Array[H2][beforeW3] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW3]
                        case 4:
                            // beforeW1
                            newCombo2Array[H1][beforeW1] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW1]
                            newCombo2Array[H2][beforeW1] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW1]
                            // beforeW2
                            newCombo2Array[H1][beforeW2] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW2]
                            newCombo2Array[H2][beforeW2] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW2]
                            // beforeW3
                            newCombo2Array[H1][beforeW3] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW3]
                            newCombo2Array[H2][beforeW3] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW3]
                            // beforeW4
                            newCombo2Array[H1][beforeW4] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW3] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW4] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW4]
                            newCombo2Array[H2][beforeW4] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW3] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW4] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW4]
                        case 5:
                            // beforeW1
                            newCombo2Array[H1][beforeW1] =
                                originalComboArray[H1][beforeW1] ==  originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW1]
                            newCombo2Array[H2][beforeW1] =
                                originalComboArray[H2][beforeW1] ==  originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW1]
                            // beforeW2
                            newCombo2Array[H1][beforeW2] =
                                originalComboArray[H1][beforeW1] ==  originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW2] ==  originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW2]
                            newCombo2Array[H2][beforeW2] =
                                originalComboArray[H2][beforeW1] ==  originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW2] ==  originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW2]
                            // beforeW3
                            newCombo2Array[H1][beforeW3] =
                                originalComboArray[H1][beforeW1] ==  originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW2] ==  originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW3] ==  originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW3]
                            newCombo2Array[H2][beforeW3] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW3]
                            // beforeW4
                            newCombo2Array[H1][beforeW4] =
                                originalComboArray[H1][beforeW1] ==  originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW2] ==  originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW3] ==  originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW4] ==  originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW4]
                            newCombo2Array[H2][beforeW4] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW3] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW4] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW4]
                            // beforeW5
                            newCombo2Array[H1][beforeW5] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW3] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW5] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW5] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW5]
                            newCombo2Array[H2][beforeW5] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW3] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW4] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW5] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW5]
                        default:
                            break
                        }
                        
                        if H == 0 && originalComboArray[H3][W] == originalComboArray[H][W]
                        {
                            newCombo2Array[H3][W] = 6
                            switch W {
                            case 1:
                                // beforeW1
                                newCombo2Array[H3][beforeW1] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW1]
                            case 2:
                                // beforeW1
                                newCombo2Array[H3][beforeW1] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW1]
                                // beforeW2
                                newCombo2Array[H3][beforeW2] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW2]
                            case 3:
                                // beforeW1
                                newCombo2Array[H3][beforeW1] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW1]
                                // beforeW2
                                newCombo2Array[H3][beforeW2] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW2]
                                // beforeW3
                                newCombo2Array[H3][beforeW3] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW3]
                            case 4:
                                // beforeW1
                                newCombo2Array[H3][beforeW1] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW1]
                                // beforeW2
                                newCombo2Array[H3][beforeW2] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW2]
                                // beforeW3
                                newCombo2Array[H3][beforeW3] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW3]
                                // beforeW4
                                newCombo2Array[H3][beforeW4] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW4] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW4]
                            case 5:
                                // beforeW1
                                newCombo2Array[H3][beforeW1] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW1]
                                // beforeW2
                                newCombo2Array[H3][beforeW2] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW2]
                                // beforeW3
                                newCombo2Array[H3][beforeW3] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW3]
                                // beforeW4
                                newCombo2Array[H3][beforeW4] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW4] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW4]
                                // beforeW5
                                newCombo2Array[H3][beforeW5] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW4] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW5] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW5]
                            default:
                                break
                            }
                        }
                        
                        if H == 0 && originalComboArray[H3][W] == originalComboArray[H][W] && originalComboArray[H4][W] == originalComboArray[H][W]
                        {
                            newCombo2Array[H4][W] = 6
                            switch W {
                            case 1:
                                // beforeW1
                                newCombo2Array[H4][beforeW1] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW1]
                            case 2:
                                // beforeW1
                                newCombo2Array[H4][beforeW1] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW1]
                                // beforeW2
                                newCombo2Array[H4][beforeW2] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW2]
                            case 3:
                                // beforeW1
                                newCombo2Array[H4][beforeW1] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW1]
                                // beforeW2
                                newCombo2Array[H4][beforeW2] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW2]
                                // beforeW3
                                newCombo2Array[H4][beforeW3] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW3]
                            case 4:
                                // beforeW1
                                newCombo2Array[H4][beforeW1] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW1]
                                // beforeW2
                                newCombo2Array[H4][beforeW2] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW2]
                                // beforeW3
                                newCombo2Array[H4][beforeW3] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW3]
                                // beforeW4
                                newCombo2Array[H4][beforeW4] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW3] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW4] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW4]
                            case 5:
                                // beforeW1
                                newCombo2Array[H4][beforeW1] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW1]
                                // beforeW2
                                newCombo2Array[H4][beforeW2] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW2]
                                // beforeW3
                                newCombo2Array[H4][beforeW3] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW3]
                                // beforeW4
                                newCombo2Array[H4][beforeW4] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW3] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW4] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW4]
                                // beforeW5
                                newCombo2Array[H4][beforeW5] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW3] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW4] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW5] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW5]
                            default:
                                break
                            }
                        }
                        
                        if H == 1 && originalComboArray[H3][W] == originalComboArray[H][W]
                        {
                            newCombo2Array[H3][W] = 6
                            switch W {
                            case 1:
                                // beforeW1
                                newCombo2Array[H3][beforeW1] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW1]
                            case 2:
                                // beforeW1
                                newCombo2Array[H3][beforeW1] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW1]
                                // beforeW2
                                newCombo2Array[H3][beforeW2] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW2]
                            case 3:
                                // beforeW1
                                newCombo2Array[H3][beforeW1] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW1]
                                // beforeW2
                                newCombo2Array[H3][beforeW2] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW2]
                                // beforeW3
                                newCombo2Array[H3][beforeW3] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW3]
                            case 4:
                                // beforeW1
                                newCombo2Array[H3][beforeW1] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW1]
                                // beforeW2
                                newCombo2Array[H3][beforeW2] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW2]
                                // beforeW3
                                newCombo2Array[H3][beforeW3] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW3]
                                // beforeW4
                                newCombo2Array[H3][beforeW4] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW4] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW4]
                            case 5:
                                // beforeW1
                                newCombo2Array[H3][beforeW1] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW1]
                                // beforeW2
                                newCombo2Array[H3][beforeW2] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW2]
                                // beforeW3
                                newCombo2Array[H3][beforeW3] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW3]
                                // beforeW4
                                newCombo2Array[H3][beforeW4] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW4] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW4]
                                // beforeW5
                                newCombo2Array[H3][beforeW5] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW4] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW5] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW5]
                            default:
                                break
                            }
                        }
                    }
                }
            case 2:
                // check width
                if W <= 3
                {
                    if originalComboArray[H][W] == originalComboArray[H][W1] && originalComboArray[H][W] == originalComboArray[H][W2] && originalComboArray[H][W] != 6
                    {
                        if newCombo2Array[H][W] != 6 && newCombo2Array[H][W1] != 6 && newCombo2Array[H][W2] != 6
                        {
                            combo += 1
                            //NSLog("[\(H)][\(W)]")
                        }
                        
                        newCombo2Array[H][W] = 6
                        newCombo2Array[H][W1] = 6
                        newCombo2Array[H][W2] = 6
                        
                        if H <= 3
                        {
                            newCombo2Array[H1][W] = originalComboArray[H1][W] == 2 ? 6 : newCombo2Array[H1][W]
                            newCombo2Array[H1][W1] = originalComboArray[H1][W1] == 2 ? 6 : newCombo2Array[H1][W1]
                            newCombo2Array[H1][W2] = originalComboArray[H1][W2] == 2 ? 6 : newCombo2Array[H1][W2]
                        }
                        if W <= 2
                        {
                            newCombo2Array[H][W3] = originalComboArray[H][W3] == 2 ? 6 : newCombo2Array[H][W3]
                        }
                    }
                }
                // Check height
                if H <= 2
                {
                    if originalComboArray[H][W] == originalComboArray[H1][W] && originalComboArray[H][W] == originalComboArray[H2][W] && originalComboArray[H][W] != 6
                    {
                        if newCombo2Array[H][W] != 6 && newCombo2Array[H1][W] != 6 && newCombo2Array[H2][W] != 6
                        {
                            combo += 1
                            //NSLog("[\(H)][\(W)]")
                        }
                        
                        newCombo2Array[H][W] = 6
                        newCombo2Array[H1][W] = 6
                        newCombo2Array[H2][W] = 6
                        
                        if W <= 4
                        {
                            newCombo2Array[H][W1] = originalComboArray[H][W1] == 2 ? 6 : newCombo2Array[H][W1]
                            newCombo2Array[H1][W1] = originalComboArray[H1][W1] == 2 ? 6 : newCombo2Array[H1][W1]
                            newCombo2Array[H2][W1] = originalComboArray[H2][W1] == 2 ? 6 : newCombo2Array[H2][W1]
                        }
                        switch W {
                        case 1:
                            // beforeW1
                            newCombo2Array[H1][beforeW1] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW1]
                            newCombo2Array[H2][beforeW1] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW1]
                        case 2:
                            // beforeW1
                            newCombo2Array[H1][beforeW1] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW1]
                            newCombo2Array[H2][beforeW1] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW1]
                            // beforeW2
                            newCombo2Array[H1][beforeW2] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW2]
                            newCombo2Array[H2][beforeW2] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW2]
                        case 3:
                            // beforeW1
                            newCombo2Array[H1][beforeW1] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW1]
                            newCombo2Array[H2][beforeW1] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW1]
                            // beforeW2
                            newCombo2Array[H1][beforeW2] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW2]
                            newCombo2Array[H2][beforeW2] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW2]
                            // beforeW3
                            newCombo2Array[H1][beforeW3] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW3]
                            newCombo2Array[H2][beforeW3] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW3]
                        case 4:
                            // beforeW1
                            newCombo2Array[H1][beforeW1] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW1]
                            newCombo2Array[H2][beforeW1] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW1]
                            // beforeW2
                            newCombo2Array[H1][beforeW2] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW2]
                            newCombo2Array[H2][beforeW2] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW2]
                            // beforeW3
                            newCombo2Array[H1][beforeW3] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW3]
                            newCombo2Array[H2][beforeW3] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW3]
                            // beforeW4
                            newCombo2Array[H1][beforeW4] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW3] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW4] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW4]
                            newCombo2Array[H2][beforeW4] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW3] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW4] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW4]
                        case 5:
                            // beforeW1
                            newCombo2Array[H1][beforeW1] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW1]
                            newCombo2Array[H2][beforeW1] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW1]
                            // beforeW2
                            newCombo2Array[H1][beforeW2] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW2]
                            newCombo2Array[H2][beforeW2] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW2]
                            // beforeW3
                            newCombo2Array[H1][beforeW3] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW3]
                            newCombo2Array[H2][beforeW3] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW3]
                            // beforeW4
                            newCombo2Array[H1][beforeW4] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW3] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW4] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW4]
                            newCombo2Array[H2][beforeW4] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW3] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW4] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW4]
                            // beforeW5
                            newCombo2Array[H1][beforeW5] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW3] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW5] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW5] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW5]
                            newCombo2Array[H2][beforeW5] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW3] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW4] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW5] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW5]
                        default:
                            break
                        }
                        
                        if H == 0 && originalComboArray[H3][W] == originalComboArray[H][W]
                        {
                            newCombo2Array[H3][W] = 6
                            switch W {
                            case 1:
                                // beforeW1
                                newCombo2Array[H3][beforeW1] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW1]
                            case 2:
                                // beforeW1
                                newCombo2Array[H3][beforeW1] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW1]
                                // beforeW2
                                newCombo2Array[H3][beforeW2] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW2]
                            case 3:
                                // beforeW1
                                newCombo2Array[H3][beforeW1] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW1]
                                // beforeW2
                                newCombo2Array[H3][beforeW2] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW2]
                                // beforeW3
                                newCombo2Array[H3][beforeW3] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW3]
                            case 4:
                                // beforeW1
                                newCombo2Array[H3][beforeW1] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW1]
                                // beforeW2
                                newCombo2Array[H3][beforeW2] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW2]
                                // beforeW3
                                newCombo2Array[H3][beforeW3] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW3]
                                // beforeW4
                                newCombo2Array[H3][beforeW4] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW4] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW4]
                            case 5:
                                // beforeW1
                                newCombo2Array[H3][beforeW1] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW1]
                                // beforeW2
                                newCombo2Array[H3][beforeW2] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW2]
                                // beforeW3
                                newCombo2Array[H3][beforeW3] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW3]
                                // beforeW4
                                newCombo2Array[H3][beforeW4] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW4] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW4]
                                // beforeW5
                                newCombo2Array[H3][beforeW5] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW4] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW5] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW5]
                            default:
                                break
                            }
                        }
                        
                        if H == 0 && originalComboArray[H3][W] == originalComboArray[H][W] && originalComboArray[H4][W] == originalComboArray[H][W]
                        {
                            newCombo2Array[H4][W] = 6
                            switch W {
                            case 1:
                                // beforeW1
                                newCombo2Array[H4][beforeW1] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW1]
                            case 2:
                                // beforeW1
                                newCombo2Array[H4][beforeW1] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW1]
                                // beforeW2
                                newCombo2Array[H4][beforeW2] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW2]
                            case 3:
                                // beforeW1
                                newCombo2Array[H4][beforeW1] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW1]
                                // beforeW2
                                newCombo2Array[H4][beforeW2] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW2]
                                // beforeW3
                                newCombo2Array[H4][beforeW3] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW3]
                            case 4:
                                // beforeW1
                                newCombo2Array[H4][beforeW1] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW1]
                                // beforeW2
                                newCombo2Array[H4][beforeW2] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW2]
                                // beforeW3
                                newCombo2Array[H4][beforeW3] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW3]
                                // beforeW4
                                newCombo2Array[H4][beforeW4] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW3] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW4] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW4]
                            case 5:
                                // beforeW1
                                newCombo2Array[H4][beforeW1] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW1]
                                // beforeW2
                                newCombo2Array[H4][beforeW2] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW2]
                                // beforeW3
                                newCombo2Array[H4][beforeW3] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW3]
                                // beforeW4
                                newCombo2Array[H4][beforeW4] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW3] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW4] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW4]
                                // beforeW5
                                newCombo2Array[H4][beforeW5] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW3] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW4] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW5] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW5]
                            default:
                                break
                            }
                        }
                        
                        if H == 1 && originalComboArray[H3][W] == originalComboArray[H][W]
                        {
                            newCombo2Array[H3][W] = 6
                            switch W {
                            case 1:
                                // beforeW1
                                newCombo2Array[H3][beforeW1] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW1]
                            case 2:
                                // beforeW1
                                newCombo2Array[H3][beforeW1] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW1]
                                // beforeW2
                                newCombo2Array[H3][beforeW2] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW2]
                            case 3:
                                // beforeW1
                                newCombo2Array[H3][beforeW1] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW1]
                                // beforeW2
                                newCombo2Array[H3][beforeW2] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW2]
                                // beforeW3
                                newCombo2Array[H3][beforeW3] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW3]
                            case 4:
                                // beforeW1
                                newCombo2Array[H3][beforeW1] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW1]
                                // beforeW2
                                newCombo2Array[H3][beforeW2] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW2]
                                // beforeW3
                                newCombo2Array[H3][beforeW3] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW3]
                                // beforeW4
                                newCombo2Array[H3][beforeW4] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW4] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW4]
                            case 5:
                                // beforeW1
                                newCombo2Array[H3][beforeW1] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW1]
                                // beforeW2
                                newCombo2Array[H3][beforeW2] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW2]
                                // beforeW3
                                newCombo2Array[H3][beforeW3] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW3]
                                // beforeW4
                                newCombo2Array[H3][beforeW4] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW4] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW4]
                                // beforeW5
                                newCombo2Array[H3][beforeW5] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW4] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW5] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW5]
                            default:
                                break
                            }
                        }
                    }
                }
            case 3:
                // Check width
                if W <= 3
                {
                    if originalComboArray[H][W] == originalComboArray[H][W1] && originalComboArray[H][W] == originalComboArray[H][W2] && originalComboArray[H][W] != 6
                    {
                        if newCombo2Array[H][W] != 6 && newCombo2Array[H][W1] != 6 && newCombo2Array[H][W2] != 6
                        {
                            combo += 1
                            //NSLog("[\(H)][\(W)]")
                        }
                        
                        newCombo2Array[H][W] = 6
                        newCombo2Array[H][W1] = 6
                        newCombo2Array[H][W2] = 6
                        
                        if H <= 3
                        {
                            newCombo2Array[H1][W] = originalComboArray[H1][W] == 3 ? 6 : newCombo2Array[H1][W]
                            newCombo2Array[H1][W1] = originalComboArray[H1][W1] == 3 ? 6 : newCombo2Array[H1][W1]
                            newCombo2Array[H1][W2] = originalComboArray[H1][W2] == 3 ? 6 : newCombo2Array[H1][W2]
                        }
                        if W <= 2
                        {
                            newCombo2Array[H][W3] = originalComboArray[H][W3] == 3 ? 6 : newCombo2Array[H][W3]
                        }
                    }
                }
                // Check height
                if H <= 2
                {
                    if originalComboArray[H][W] == originalComboArray[H1][W] && originalComboArray[H][W] == originalComboArray[H2][W] && originalComboArray[H][W] != 6
                    {
                        if newCombo2Array[H][W] != 6 && newCombo2Array[H1][W] != 6 && newCombo2Array[H2][W] != 6
                        {
                            combo += 1
                            //NSLog("[\(H)][\(W)]")
                        }
                        
                        newCombo2Array[H][W] = 6
                        newCombo2Array[H1][W] = 6
                        newCombo2Array[H2][W] = 6
                        
                        if W <= 4
                        {
                            newCombo2Array[H][W1] = originalComboArray[H][W1] == 3 ? 6 : newCombo2Array[H][W1]
                            newCombo2Array[H1][W1] = originalComboArray[H1][W1] == 3 ? 6 : newCombo2Array[H1][W1]
                            newCombo2Array[H2][W1] = originalComboArray[H2][W1] == 3 ? 6 : newCombo2Array[H2][W1]
                        }
                        switch W {
                        case 1:
                            // beforeW1
                            newCombo2Array[H1][beforeW1] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW1]
                            newCombo2Array[H2][beforeW1] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW1]
                        case 2:
                            // beforeW1
                            newCombo2Array[H1][beforeW1] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW1]
                            newCombo2Array[H2][beforeW1] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW1]
                            // beforeW2
                            newCombo2Array[H1][beforeW2] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW2]
                            newCombo2Array[H2][beforeW2] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW2]
                        case 3:
                            // beforeW1
                            newCombo2Array[H1][beforeW1] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW1]
                            newCombo2Array[H2][beforeW1] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW1]
                            // beforeW2
                            newCombo2Array[H1][beforeW2] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW2]
                            newCombo2Array[H2][beforeW2] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW2]
                            // beforeW3
                            newCombo2Array[H1][beforeW3] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW3]
                            newCombo2Array[H2][beforeW3] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW3]
                        case 4:
                            // beforeW1
                            newCombo2Array[H1][beforeW1] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW1]
                            newCombo2Array[H2][beforeW1] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW1]
                            // beforeW2
                            newCombo2Array[H1][beforeW2] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW2]
                            newCombo2Array[H2][beforeW2] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW2]
                            // beforeW3
                            newCombo2Array[H1][beforeW3] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW3]
                            newCombo2Array[H2][beforeW3] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW3]
                            // beforeW4
                            newCombo2Array[H1][beforeW4] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW3] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW4] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW4]
                            newCombo2Array[H2][beforeW4] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW3] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW4] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW4]
                        case 5:
                            // beforeW1
                            newCombo2Array[H1][beforeW1] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW1]
                            newCombo2Array[H2][beforeW1] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW1]
                            // beforeW2
                            newCombo2Array[H1][beforeW2] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW2]
                            newCombo2Array[H2][beforeW2] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW2]
                            // beforeW3
                            newCombo2Array[H1][beforeW3] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW3]
                            newCombo2Array[H2][beforeW3] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW3]
                            // beforeW4
                            newCombo2Array[H1][beforeW4] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW3] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW4] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW4]
                            newCombo2Array[H2][beforeW4] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW3] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW4] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW4]
                            // beforeW5
                            newCombo2Array[H1][beforeW5] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW3] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW5] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW5] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW5]
                            newCombo2Array[H2][beforeW5] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW3] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW4] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW5] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW5]
                        default:
                            break
                        }
                        
                        if H == 0 && originalComboArray[H3][W] == originalComboArray[H][W]
                        {
                            newCombo2Array[H3][W] = 6
                            switch W {
                            case 1:
                                // beforeW1
                                newCombo2Array[H3][beforeW1] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW1]
                            case 2:
                                // beforeW1
                                newCombo2Array[H3][beforeW1] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW1]
                                // beforeW2
                                newCombo2Array[H3][beforeW2] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW2]
                            case 3:
                                // beforeW1
                                newCombo2Array[H3][beforeW1] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW1]
                                // beforeW2
                                newCombo2Array[H3][beforeW2] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW2]
                                // beforeW3
                                newCombo2Array[H3][beforeW3] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW3]
                            case 4:
                                // beforeW1
                                newCombo2Array[H3][beforeW1] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW1]
                                // beforeW2
                                newCombo2Array[H3][beforeW2] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW2]
                                // beforeW3
                                newCombo2Array[H3][beforeW3] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW3]
                                // beforeW4
                                newCombo2Array[H3][beforeW4] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW4] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW4]
                            case 5:
                                // beforeW1
                                newCombo2Array[H3][beforeW1] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW1]
                                // beforeW2
                                newCombo2Array[H3][beforeW2] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW2]
                                // beforeW3
                                newCombo2Array[H3][beforeW3] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW3]
                                // beforeW4
                                newCombo2Array[H3][beforeW4] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW4] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW4]
                                // beforeW5
                                newCombo2Array[H3][beforeW5] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW4] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW5] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW5]
                            default:
                                break
                            }
                        }
                        
                        if H == 0 && originalComboArray[H3][W] == originalComboArray[H][W] && originalComboArray[H4][W] == originalComboArray[H][W]
                        {
                            newCombo2Array[H4][W] = 6
                            switch W {
                            case 1:
                                // beforeW1
                                newCombo2Array[H4][beforeW1] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW1]
                            case 2:
                                // beforeW1
                                newCombo2Array[H4][beforeW1] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW1]
                                // beforeW2
                                newCombo2Array[H4][beforeW2] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW2]
                            case 3:
                                // beforeW1
                                newCombo2Array[H4][beforeW1] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW1]
                                // beforeW2
                                newCombo2Array[H4][beforeW2] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW2]
                                // beforeW3
                                newCombo2Array[H4][beforeW3] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW3]
                            case 4:
                                // beforeW1
                                newCombo2Array[H4][beforeW1] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW1]
                                // beforeW2
                                newCombo2Array[H4][beforeW2] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW2]
                                // beforeW3
                                newCombo2Array[H4][beforeW3] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW3]
                                // beforeW4
                                newCombo2Array[H4][beforeW4] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW3] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW4] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW4]
                            case 5:
                                // beforeW1
                                newCombo2Array[H4][beforeW1] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW1]
                                // beforeW2
                                newCombo2Array[H4][beforeW2] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW2]
                                // beforeW3
                                newCombo2Array[H4][beforeW3] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW3]
                                // beforeW4
                                newCombo2Array[H4][beforeW4] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW3] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW4] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW4]
                                // beforeW5
                                newCombo2Array[H4][beforeW5] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW3] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW4] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW5] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW5]
                            default:
                                break
                            }
                        }
                        
                        if H == 1 && originalComboArray[H3][W] == originalComboArray[H][W]
                        {
                            newCombo2Array[H3][W] = 6
                            switch W {
                            case 1:
                                // beforeW1
                                newCombo2Array[H3][beforeW1] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW1]
                            case 2:
                                // beforeW1
                                newCombo2Array[H3][beforeW1] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW1]
                                // beforeW2
                                newCombo2Array[H3][beforeW2] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW2]
                            case 3:
                                // beforeW1
                                newCombo2Array[H3][beforeW1] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW1]
                                // beforeW2
                                newCombo2Array[H3][beforeW2] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW2]
                                // beforeW3
                                newCombo2Array[H3][beforeW3] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW3]
                            case 4:
                                // beforeW1
                                newCombo2Array[H3][beforeW1] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW1]
                                // beforeW2
                                newCombo2Array[H3][beforeW2] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW2]
                                // beforeW3
                                newCombo2Array[H3][beforeW3] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW3]
                                // beforeW4
                                newCombo2Array[H3][beforeW4] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW4] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW4]
                            case 5:
                                // beforeW1
                                newCombo2Array[H3][beforeW1] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW1]
                                // beforeW2
                                newCombo2Array[H3][beforeW2] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW2]
                                // beforeW3
                                newCombo2Array[H3][beforeW3] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW3]
                                // beforeW4
                                newCombo2Array[H3][beforeW4] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW4] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW4]
                                // beforeW5
                                newCombo2Array[H3][beforeW5] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW4] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW5] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW5]
                            default:
                                break
                            }
                        }
                    }
                }
            case 4:
                // Check width
                if W <= 3
                {
                    if originalComboArray[H][W] == originalComboArray[H][W1] && originalComboArray[H][W] == originalComboArray[H][W2] && originalComboArray[H][W] != 6
                    {
                        if newCombo2Array[H][W] != 6 && newCombo2Array[H][W1] != 6 && newCombo2Array[H][W2] != 6
                        {
                            combo += 1
                            //NSLog("[\(H)][\(W)]")
                        }
                        
                        newCombo2Array[H][W] = 6
                        newCombo2Array[H][W1] = 6
                        newCombo2Array[H][W2] = 6
                        
                        if H <= 3
                        {
                            newCombo2Array[H1][W] = originalComboArray[H1][W] == 4 ? 6 : newCombo2Array[H1][W]
                            newCombo2Array[H1][W1] = originalComboArray[H1][W1] == 4 ? 6 : newCombo2Array[H1][W1]
                            newCombo2Array[H1][W2] = originalComboArray[H1][W2] == 4 ? 6 : newCombo2Array[H1][W2]
                        }
                        if W <= 2
                        {
                            newCombo2Array[H][W3] = originalComboArray[H][W3] == 4 ? 6 : newCombo2Array[H][W3]
                        }
                    }
                }
                // Check height
                if H <= 2
                {
                    if originalComboArray[H][W] == originalComboArray[H1][W] && originalComboArray[H][W] == originalComboArray[H2][W] && originalComboArray[H][W] != 6
                    {
                        if newCombo2Array[H][W] != 6 && newCombo2Array[H1][W] != 6 && newCombo2Array[H2][W] != 6
                        {
                            combo += 1
                            //NSLog("[\(H)][\(W)]")
                        }
                        
                        newCombo2Array[H][W] = 6
                        newCombo2Array[H1][W] = 6
                        newCombo2Array[H2][W] = 6
                        
                        if W <= 4
                        {
                            newCombo2Array[H][W1] = originalComboArray[H][W1] == 4 ? 6 : newCombo2Array[H][W1]
                            newCombo2Array[H1][W1] = originalComboArray[H1][W1] == 4 ? 6 : newCombo2Array[H1][W1]
                            newCombo2Array[H2][W1] = originalComboArray[H2][W1] == 4 ? 6 : newCombo2Array[H2][W1]
                        }
                        switch W {
                        case 1:
                            // beforeW1
                            newCombo2Array[H1][beforeW1] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW1]
                            newCombo2Array[H2][beforeW1] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW1]
                        case 2:
                            // beforeW1
                            newCombo2Array[H1][beforeW1] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW1]
                            newCombo2Array[H2][beforeW1] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW1]
                            // beforeW2
                            newCombo2Array[H1][beforeW2] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW2]
                            newCombo2Array[H2][beforeW2] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW2]
                        case 3:
                            // beforeW1
                            newCombo2Array[H1][beforeW1] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW1]
                            newCombo2Array[H2][beforeW1] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW1]
                            // beforeW2
                            newCombo2Array[H1][beforeW2] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW2]
                            newCombo2Array[H2][beforeW2] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW2]
                            // beforeW3
                            newCombo2Array[H1][beforeW3] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW3]
                            newCombo2Array[H2][beforeW3] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW3]
                        case 4:
                            // beforeW1
                            newCombo2Array[H1][beforeW1] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW1]
                            newCombo2Array[H2][beforeW1] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW1]
                            // beforeW2
                            newCombo2Array[H1][beforeW2] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW2]
                            newCombo2Array[H2][beforeW2] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW2]
                            // beforeW3
                            newCombo2Array[H1][beforeW3] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW3]
                            newCombo2Array[H2][beforeW3] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW3]
                            // beforeW4
                            newCombo2Array[H1][beforeW4] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW3] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW4] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW4]
                            newCombo2Array[H2][beforeW4] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW3] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW4] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW4]
                        case 5:
                            // beforeW1
                            newCombo2Array[H1][beforeW1] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW1]
                            newCombo2Array[H2][beforeW1] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW1]
                            // beforeW2
                            newCombo2Array[H1][beforeW2] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW2]
                            newCombo2Array[H2][beforeW2] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW2]
                            // beforeW3
                            newCombo2Array[H1][beforeW3] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW3]
                            newCombo2Array[H2][beforeW3] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW3]
                            // beforeW4
                            newCombo2Array[H1][beforeW4] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW3] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW4] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW4]
                            newCombo2Array[H2][beforeW4] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW3] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW4] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW4]
                            // beforeW5
                            newCombo2Array[H1][beforeW5] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW3] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW5] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW5] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW5]
                            newCombo2Array[H2][beforeW5] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW3] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW4] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW5] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW5]
                        default:
                            break
                        }
                        
                        if H == 0 && originalComboArray[H3][W] == originalComboArray[H][W]
                        {
                            newCombo2Array[H3][W] = 6
                            switch W {
                            case 1:
                                // beforeW1
                                newCombo2Array[H3][beforeW1] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW1]
                            case 2:
                                // beforeW1
                                newCombo2Array[H3][beforeW1] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW1]
                                // beforeW2
                                newCombo2Array[H3][beforeW2] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW2]
                            case 3:
                                // beforeW1
                                newCombo2Array[H3][beforeW1] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW1]
                                // beforeW2
                                newCombo2Array[H3][beforeW2] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW2]
                                // beforeW3
                                newCombo2Array[H3][beforeW3] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW3]
                            case 4:
                                // beforeW1
                                newCombo2Array[H3][beforeW1] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW1]
                                // beforeW2
                                newCombo2Array[H3][beforeW2] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW2]
                                // beforeW3
                                newCombo2Array[H3][beforeW3] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW3]
                                // beforeW4
                                newCombo2Array[H3][beforeW4] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW4] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW4]
                            case 5:
                                // beforeW1
                                newCombo2Array[H3][beforeW1] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW1]
                                // beforeW2
                                newCombo2Array[H3][beforeW2] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW2]
                                // beforeW3
                                newCombo2Array[H3][beforeW3] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW3]
                                // beforeW4
                                newCombo2Array[H3][beforeW4] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW4] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW4]
                                // beforeW5
                                newCombo2Array[H3][beforeW5] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW4] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW5] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW5]
                            default:
                                break
                            }
                        }
                        
                        if H == 0 && originalComboArray[H3][W] == originalComboArray[H][W] && originalComboArray[H4][W] == originalComboArray[H][W]
                        {
                            newCombo2Array[H4][W] = 6
                            switch W {
                            case 1:
                                // beforeW1
                                newCombo2Array[H4][beforeW1] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW1]
                            case 2:
                                // beforeW1
                                newCombo2Array[H4][beforeW1] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW1]
                                // beforeW2
                                newCombo2Array[H4][beforeW2] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW2]
                            case 3:
                                // beforeW1
                                newCombo2Array[H4][beforeW1] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW1]
                                // beforeW2
                                newCombo2Array[H4][beforeW2] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW2]
                                // beforeW3
                                newCombo2Array[H4][beforeW3] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW3]
                            case 4:
                                // beforeW1
                                newCombo2Array[H4][beforeW1] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW1]
                                // beforeW2
                                newCombo2Array[H4][beforeW2] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW2]
                                // beforeW3
                                newCombo2Array[H4][beforeW3] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW3]
                                // beforeW4
                                newCombo2Array[H4][beforeW4] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW3] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW4] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW4]
                            case 5:
                                // beforeW1
                                newCombo2Array[H4][beforeW1] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW1]
                                // beforeW2
                                newCombo2Array[H4][beforeW2] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW2]
                                // beforeW3
                                newCombo2Array[H4][beforeW3] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW3]
                                // beforeW4
                                newCombo2Array[H4][beforeW4] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW3] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW4] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW4]
                                // beforeW5
                                newCombo2Array[H4][beforeW5] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW3] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW4] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW5] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW5]
                            default:
                                break
                            }
                        }
                        
                        if H == 1 && originalComboArray[H3][W] == originalComboArray[H][W]
                        {
                            newCombo2Array[H3][W] = 6
                            switch W {
                            case 1:
                                // beforeW1
                                newCombo2Array[H3][beforeW1] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW1]
                            case 2:
                                // beforeW1
                                newCombo2Array[H3][beforeW1] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW1]
                                // beforeW2
                                newCombo2Array[H3][beforeW2] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW2]
                            case 3:
                                // beforeW1
                                newCombo2Array[H3][beforeW1] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW1]
                                // beforeW2
                                newCombo2Array[H3][beforeW2] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW2]
                                // beforeW3
                                newCombo2Array[H3][beforeW3] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW3]
                            case 4:
                                // beforeW1
                                newCombo2Array[H3][beforeW1] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW1]
                                // beforeW2
                                newCombo2Array[H3][beforeW2] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW2]
                                // beforeW3
                                newCombo2Array[H3][beforeW3] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW3]
                                // beforeW4
                                newCombo2Array[H3][beforeW4] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW4] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW4]
                            case 5:
                                // beforeW1
                                newCombo2Array[H3][beforeW1] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW1]
                                // beforeW2
                                newCombo2Array[H3][beforeW2] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW2]
                                // beforeW3
                                newCombo2Array[H3][beforeW3] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW3]
                                // beforeW4
                                newCombo2Array[H3][beforeW4] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW4] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW4]
                                // beforeW5
                                newCombo2Array[H3][beforeW5] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW4] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW5] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW5]
                            default:
                                break
                            }
                        }
                    }
                }
            case 5:
                // Check width
                if W <= 3
                {
                    if originalComboArray[H][W] == originalComboArray[H][W1] && originalComboArray[H][W] == originalComboArray[H][W2] && originalComboArray[H][W] != 6
                    {
                        if newCombo2Array[H][W] != 6 && newCombo2Array[H][W1] != 6 && newCombo2Array[H][W2] != 6
                        {
                            combo += 1
                            //NSLog("[\(H)][\(W)]")
                        }
                        
                        newCombo2Array[H][W] = 6
                        newCombo2Array[H][W1] = 6
                        newCombo2Array[H][W2] = 6
                        
                        if H <= 3
                        {
                            newCombo2Array[H1][W] = originalComboArray[H1][W] == 5 ? 6 : newCombo2Array[H1][W]
                            newCombo2Array[H1][W1] = originalComboArray[H1][W1] == 5 ? 6 : newCombo2Array[H1][W1]
                            newCombo2Array[H1][W2] = originalComboArray[H1][W2] == 5 ? 6 : newCombo2Array[H1][W2]
                        }
                        if W <= 2
                        {
                            newCombo2Array[H][W3] = originalComboArray[H][W3] == 5 ? 6 : newCombo2Array[H][W3]
                        }
                    }
                }
                // Check height
                if H <= 2
                {
                    if originalComboArray[H][W] == originalComboArray[H1][W] && originalComboArray[H][W] == originalComboArray[H2][W] && originalComboArray[H][W] != 6
                    {
                        if newCombo2Array[H][W] != 6 && newCombo2Array[H1][W] != 6 && newCombo2Array[H2][W] != 6
                        {
                            combo += 1
                            //NSLog("[\(H)][\(W)]")
                        }
                        
                        newCombo2Array[H][W] = 6
                        newCombo2Array[H1][W] = 6
                        newCombo2Array[H2][W] = 6
                        
                        if W <= 4
                        {
                            newCombo2Array[H][W1] = originalComboArray[H][W1] == 5 ? 6 : newCombo2Array[H][W1]
                            newCombo2Array[H1][W1] = originalComboArray[H1][W1] == 5 ? 6 : newCombo2Array[H1][W1]
                            newCombo2Array[H2][W1] = originalComboArray[H2][W1] == 5 ? 6 : newCombo2Array[H2][W1]
                        }
                        switch W {
                        case 1:
                            // beforeW1
                            newCombo2Array[H1][beforeW1] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW1]
                            newCombo2Array[H2][beforeW1] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW1]
                        case 2:
                            // beforeW1
                            newCombo2Array[H1][beforeW1] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW1]
                            newCombo2Array[H2][beforeW1] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW1]
                            // beforeW2
                            newCombo2Array[H1][beforeW2] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW2]
                            newCombo2Array[H2][beforeW2] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW2]
                        case 3:
                            // beforeW1
                            newCombo2Array[H1][beforeW1] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW1]
                            newCombo2Array[H2][beforeW1] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW1]
                            // beforeW2
                            newCombo2Array[H1][beforeW2] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW2]
                            newCombo2Array[H2][beforeW2] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW2]
                            // beforeW3
                            newCombo2Array[H1][beforeW3] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW3]
                            newCombo2Array[H2][beforeW3] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW3]
                        case 4:
                            // beforeW1
                            newCombo2Array[H1][beforeW1] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW1]
                            newCombo2Array[H2][beforeW1] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW1]
                            // beforeW2
                            newCombo2Array[H1][beforeW2] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW2]
                            newCombo2Array[H2][beforeW2] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW2]
                            // beforeW3
                            newCombo2Array[H1][beforeW3] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW3]
                            newCombo2Array[H2][beforeW3] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW3]
                            // beforeW4
                            newCombo2Array[H1][beforeW4] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW3] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW4] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW4]
                            newCombo2Array[H2][beforeW4] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW3] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW4] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW4]
                        case 5:
                            // beforeW1
                            newCombo2Array[H1][beforeW1] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW1]
                            newCombo2Array[H2][beforeW1] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW1]
                            // beforeW2
                            newCombo2Array[H1][beforeW2] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW2]
                            newCombo2Array[H2][beforeW2] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW2]
                            // beforeW3
                            newCombo2Array[H1][beforeW3] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW3]
                            newCombo2Array[H2][beforeW3] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW3]
                            // beforeW4
                            newCombo2Array[H1][beforeW4] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW3] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW4] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW4]
                            newCombo2Array[H2][beforeW4] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW3] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW4] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW4]
                            // beforeW5
                            newCombo2Array[H1][beforeW5] =
                                originalComboArray[H1][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW3] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW5] == originalComboArray[H][W] &&
                                originalComboArray[H1][beforeW5] == originalComboArray[H][W] ? 6 : newCombo2Array[H1][beforeW5]
                            newCombo2Array[H2][beforeW5] =
                                originalComboArray[H2][beforeW1] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW2] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW3] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW4] == originalComboArray[H][W] &&
                                originalComboArray[H2][beforeW5] == originalComboArray[H][W] ? 6 : newCombo2Array[H2][beforeW5]
                        default:
                            break
                        }
                        
                        if H == 0 && originalComboArray[H3][W] == originalComboArray[H][W]
                        {
                            newCombo2Array[H3][W] = 6
                            switch W {
                            case 1:
                                // beforeW1
                                newCombo2Array[H3][beforeW1] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW1]
                            case 2:
                                // beforeW1
                                newCombo2Array[H3][beforeW1] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW1]
                                // beforeW2
                                newCombo2Array[H3][beforeW2] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW2]
                            case 3:
                                // beforeW1
                                newCombo2Array[H3][beforeW1] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW1]
                                // beforeW2
                                newCombo2Array[H3][beforeW2] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW2]
                                // beforeW3
                                newCombo2Array[H3][beforeW3] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW3]
                            case 4:
                                // beforeW1
                                newCombo2Array[H3][beforeW1] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW1]
                                // beforeW2
                                newCombo2Array[H3][beforeW2] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW2]
                                // beforeW3
                                newCombo2Array[H3][beforeW3] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW3]
                                // beforeW4
                                newCombo2Array[H3][beforeW4] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW4] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW4]
                            case 5:
                                // beforeW1
                                newCombo2Array[H3][beforeW1] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW1]
                                // beforeW2
                                newCombo2Array[H3][beforeW2] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW2]
                                // beforeW3
                                newCombo2Array[H3][beforeW3] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW3]
                                // beforeW4
                                newCombo2Array[H3][beforeW4] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW4] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW4]
                                // beforeW5
                                newCombo2Array[H3][beforeW5] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW4] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW5] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW5]
                            default:
                                break
                            }
                        }
                        
                        if H == 0 && originalComboArray[H3][W] == originalComboArray[H][W] && originalComboArray[H4][W] == originalComboArray[H][W]
                        {
                            newCombo2Array[H4][W] = 6
                            switch W {
                            case 1:
                                // beforeW1
                                newCombo2Array[H4][beforeW1] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW1]
                            case 2:
                                // beforeW1
                                newCombo2Array[H4][beforeW1] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW1]
                                // beforeW2
                                newCombo2Array[H4][beforeW2] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW2]
                            case 3:
                                // beforeW1
                                newCombo2Array[H4][beforeW1] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW1]
                                // beforeW2
                                newCombo2Array[H4][beforeW2] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW2]
                                // beforeW3
                                newCombo2Array[H4][beforeW3] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW3]
                            case 4:
                                // beforeW1
                                newCombo2Array[H4][beforeW1] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW1]
                                // beforeW2
                                newCombo2Array[H4][beforeW2] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW2]
                                // beforeW3
                                newCombo2Array[H4][beforeW3] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW3]
                                // beforeW4
                                newCombo2Array[H4][beforeW4] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW3] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW4] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW4]
                            case 5:
                                // beforeW1
                                newCombo2Array[H4][beforeW1] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW1]
                                // beforeW2
                                newCombo2Array[H4][beforeW2] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW2]
                                // beforeW3
                                newCombo2Array[H4][beforeW3] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW3]
                                // beforeW4
                                newCombo2Array[H4][beforeW4] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW3] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW4] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW4]
                                // beforeW5
                                newCombo2Array[H4][beforeW5] =
                                    originalComboArray[H4][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW3] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW4] == originalComboArray[H][W] &&
                                    originalComboArray[H4][beforeW5] == originalComboArray[H][W] ? 6 : newCombo2Array[H4][beforeW5]
                            default:
                                break
                            }
                        }
                        
                        if H == 1 && originalComboArray[H3][W] == originalComboArray[H][W]
                        {
                            newCombo2Array[H3][W] = 6
                            switch W {
                            case 1:
                                // beforeW1
                                newCombo2Array[H3][beforeW1] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW1]
                            case 2:
                                // beforeW1
                                newCombo2Array[H3][beforeW1] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW1]
                                // beforeW2
                                newCombo2Array[H3][beforeW2] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW2]
                            case 3:
                                // beforeW1
                                newCombo2Array[H3][beforeW1] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW1]
                                // beforeW2
                                newCombo2Array[H3][beforeW2] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW2]
                                // beforeW3
                                newCombo2Array[H3][beforeW3] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW3]
                            case 4:
                                // beforeW1
                                newCombo2Array[H3][beforeW1] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW1]
                                // beforeW2
                                newCombo2Array[H3][beforeW2] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW2]
                                // beforeW3
                                newCombo2Array[H3][beforeW3] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW3]
                                // beforeW4
                                newCombo2Array[H3][beforeW4] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW4] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW4]
                            case 5:
                                // beforeW1
                                newCombo2Array[H3][beforeW1] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW1]
                                // beforeW2
                                newCombo2Array[H3][beforeW2] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW2]
                                // beforeW3
                                newCombo2Array[H3][beforeW3] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW3]
                                // beforeW4
                                newCombo2Array[H3][beforeW4] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW4] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW4]
                                // beforeW5
                                newCombo2Array[H3][beforeW5] =
                                    originalComboArray[H3][beforeW1] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW2] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW3] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW4] == originalComboArray[H][W] &&
                                    originalComboArray[H3][beforeW5] == originalComboArray[H][W] ? 6 : newCombo2Array[H3][beforeW5]
                            default:
                                break
                            }
                        }
                    }
                }
            default:
                break
                //NSLog("Switch default")
            }
        }
        
        // Clear up and calculate again
        totalCombo += combo
        originalComboArray = clearUp(originalArray: originalComboArray)
        newCombo2Array = originalComboArray
        //NSLog("totalCombo = \(totalCombo) combo = \(combo)")
        
    } while combo >= 1
    
    //NSLog("newCombo2Array = \n\(newCombo2Array[0])\n\(newCombo2Array[1])\n\(newCombo2Array[2])\n\(newCombo2Array[3])\n\(newCombo2Array[4])")
    
    return totalCombo
}

