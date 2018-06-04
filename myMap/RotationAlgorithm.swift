//
//  RotationAlgorithm.swift
//  myMap
//
//  Created by Jim Chuang on 2018/5/23.
//  Copyright © 2018年 test. All rights reserved.
//

import Foundation

func rotationFunc(inputArray:Array<Array<Int>>) -> (routeArr:Array<Any>,sLoc:Int,combo:Int)
{
    // 初始設定
    var myInputArray = inputArray
    var totalCombo = comboCal(comboArray: myInputArray)
    var whileLoopCombo:Int = 0
    var targetComboNumbers = TARGET_COMBO_NUMBERS
    var startLocation :Int = -1 // 起手位置
    var nextStartLocation:Int = startLocation // 下次起始位置
    var nowLocation:Int = 0 // 目前位置
    var routeSave:Array<Any> = [] // 暫存路徑
    var totalRouteSave:Array<Any> = [] // 完整路徑
    var calComboArray = myInputArray // 計算盤面
    let recoverArray = myInputArray // 回復盤面
    var count:Int = 0 // 總次數計算
    var interruptCount:Int = 0
    var changeStartLocation:Bool = false // 更換起手位置

    for oneCycle in 1...90
    {
        if oneCycle == 31 || oneCycle == 61 || oneCycle == 91
        {
            NSLog("oneCycle = \(oneCycle) count = \(count)")
            targetComboNumbers -= 1
            NSLog("targetComboNumbers = \(targetComboNumbers)")
        }
        // 目標判定
        if totalCombo >= targetComboNumbers && (totalRouteSave.count <= MAX_TOTAL_STEP)
        {
            NSLog("totalCombo = \(totalCombo) targetComboNumbers = \(targetComboNumbers)")
            // 中斷for 迴圈
            break
        }
        else
        {
            // 盤面回復
            myInputArray = recoverArray
            calComboArray = recoverArray

            // 起手位置變更
            startLocation = (startLocation + 1) % 30
            nextStartLocation = startLocation
            changeStartLocation = false

            // 路徑清空
            totalRouteSave = []
            routeSave = []
            totalCombo = 0
            var mustBreak = false
            // 開始處理
            while (totalCombo < targetComboNumbers) && (changeStartLocation == false)
            {
                interruptCount = 0
                whileLoopCombo = totalCombo

                // 3x loop
                while totalCombo < (whileLoopCombo+3) && totalCombo < targetComboNumbers
                {
                    interruptCount += 1
                    let step = whileLoopCombo > 1 ? interruptCount / 6 + 7 : interruptCount / 40 + 7
                    if interruptCount > 200 || (interruptCount > 30 && whileLoopCombo > 1) || (totalRouteSave.count + step > MAX_TOTAL_STEP)
                    {
                        changeStartLocation = whileLoopCombo == 1 ? true : false
                        mustBreak = whileLoopCombo == 1 ? true : false
                        totalCombo = comboCal(comboArray: myInputArray)
                        break
                    }
                    (calComboArray,routeSave,nowLocation) = startRotation(originalArray: myInputArray,
                                                                          startLocation: nextStartLocation,
                                                                          stepFrom:step,
                                                                          stepTo:step)
                    totalCombo = comboCal(comboArray: calComboArray)
                }

                count += interruptCount
                interruptCount = 0

                // 2x loop
                while totalCombo < (whileLoopCombo+2) && totalCombo < targetComboNumbers && false
                {
                    interruptCount += 1
                    let step = interruptCount / 30 + 7
                    if interruptCount > 90 || (totalRouteSave.count + step > MAX_TOTAL_STEP)
                    {
                        totalCombo = comboCal(comboArray: myInputArray)
                        break
                    }
                    (calComboArray,routeSave,nowLocation) = startRotation(originalArray: myInputArray,
                                                                          startLocation: nextStartLocation,
                                                                          stepFrom:step,
                                                                          stepTo:step)
                    totalCombo = comboCal(comboArray: calComboArray)
                }

                count += interruptCount
                interruptCount = 0

                // 1x loop
                while totalCombo < (whileLoopCombo+1) && totalCombo < targetComboNumbers
                {
                    interruptCount += 1
                    let step = ((interruptCount/125) % 10 ) + 4
                    if (interruptCount > 500) || mustBreak || ((totalRouteSave.count + step) > MAX_TOTAL_STEP)
                    {
                        // 重置起點
                        changeStartLocation = true
                        totalCombo = comboCal(comboArray: myInputArray)
                        break
                    }
                    (calComboArray,routeSave,nowLocation) = startRotation(originalArray: myInputArray,
                                                                          startLocation: nextStartLocation,
                                                                          stepFrom:step,
                                                                          stepTo:step)
                    totalCombo = comboCal(comboArray: calComboArray)
                }

                count += interruptCount
                interruptCount = 0

                //if totalCombo != 0 {NSLog("total combo =\(totalCombo)");NSLog("count = \(count)")}

                // 更新盤面起始位置
                nextStartLocation = nowLocation

                // 更新完整路徑
                totalRouteSave = totalRouteSave + routeSave

                // 盤面更新
                myInputArray = calComboArray
            }
        }
    }


    for x in 0...totalRouteSave.count-1
    {
        switch totalRouteSave[x] {
        case 1 as Int:
            totalRouteSave[x] = "up"
        case -1 as Int:
            totalRouteSave[x] = "left"
        case 6 as Int:
            totalRouteSave[x] = "down"
        case -6 as Int:
            totalRouteSave[x] = "up"
        default:
            totalRouteSave[x] = "?"
        }
    }

    //NSLog("StartLocation = \(startLocation)")
    //NSLog("nextStartLocation = \(nextStartLocation)")
    //NSLog("total route(\(totalRouteSave.count)) = \(totalRouteSave)")

    // 迴圈執行數目
    NSLog("self.count = \(count)")
    NSLog("self.totalCombo1 = \(totalCombo)")
    //totalCombo = comboCal(comboArray: myInputArray)
    //NSLog("self.totalCombo2 = \(totalCombo)")

    // 重組後陣列
    //NSLog("self.original Array2 = \n\(myInputArray[0])\n\(myInputArray[1])\n\(myInputArray[2])\n\(myInputArray[3])\n\(myInputArray[4])")

    return (totalRouteSave,startLocation,totalCombo)
}
