//
//  RotationAlgorithm.swift
//  myMap
//
//  Created by Jim Chuang on 2018/5/23.
//  Copyright © 2018年 test. All rights reserved.
//

import Foundation

func rotationFunc(inputArray:Array<Array<Int>>) -> (routeArr:Array<Any>,sLoc:Int,combo:Int,resultArr:Array<Array<Int>>)
{
    // 初始設定
    var resArr = Array<Array<Int>>()
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
                    let step = whileLoopCombo > 1 ? interruptCount / 6 + 8 : interruptCount / 40 + 8
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
                    let step = interruptCount / 30 + 8
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
                    let step = ((interruptCount/125) % 10 ) + 5 //WTF? interrupt = 1250times is around?
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
        case RIGHT as Int:
            totalRouteSave[x] = "right"
        case LEFT as Int:
            totalRouteSave[x] = "left"
        case DOWN as Int:
            totalRouteSave[x] = "down"
        case UP as Int:
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
    NSLog("step count = \(totalRouteSave.count)")
    //totalCombo = comboCal(comboArray: myInputArray)
    //NSLog("self.totalCombo2 = \(totalCombo)")

    // 重組後陣列
    NSLog("self.original Array2 = \n\(myInputArray[0])\n\(myInputArray[1])\n\(myInputArray[2])\n\(myInputArray[3])\n\(myInputArray[4])")
    resArr = myInputArray

    return (totalRouteSave,startLocation,totalCombo,resArr)
}

func rotAlgo(inputArray:Array<Array<Int>>) -> (routeArr:Array<Any>,sLoc:Int,combo:Int,resultArr:Array<Array<Int>>){

    // result
    var routeArr = Array<Any>()
    var sLoc = 0
    var combo = 0
    var resultArr = Array<Array<Int>>()

    // data
    var targetLoc = 0
    var routeSave = Array<Any>()
    var totalRouteSave = Array<Int>()
    resultArr = inputArray

    // data2
    var saveArr = [Array<Array<Int>>]()
    var sLocArr = Array<Int>()
    var nextLocArr = Array<Int>()
    var totalRouteSaveArr = Array<Array<Int>>()
    var comboArr = Array<Int>()
    var myLoc = 0

    // cal
    let sRandArr = [0,5,24,29]
    var count = 0

NSLog("Start time1")
    myBigLoop:while combo < TARGET_COMBO_NUMBERS {
        sLoc = sRandArr.randomElement()!
        let aa = startRotation(originalArray: resultArr, startLocation: sLoc, stepFrom: 4, stepTo: 10)
        targetLoc = aa.nowLoc
        resultArr = aa.resultArr
        routeSave = aa.routeSave
        combo = comboCal(comboArray: aa.resultArr)


        if combo > 0{
            saveArr.append(aa.resultArr)
            sLocArr.append(sLoc)
            nextLocArr.append(aa.nowLoc)
            totalRouteSaveArr.append(aa.routeSave as! Array<Int>)
            comboArr.append(combo)
        }


        if saveArr.count > 0 {
            for x in 0...saveArr.count - 1{
                let bb = startRotation(originalArray: saveArr[x], startLocation: nextLocArr[x], stepFrom: 4, stepTo: 10)
                let combo = comboCal(comboArray: bb.resultArr)
count += 1
                if combo > comboArr[x]{
                    saveArr[x] = bb.resultArr
                    nextLocArr[x] = bb.nowLoc
                    let intArr = bb.routeSave as! Array<Int>
                    for y in intArr{
                        totalRouteSaveArr[x].append(y)
                    }
                    comboArr[x] = combo
                    if combo >= TARGET_COMBO_NUMBERS{
                        myLoc = x
                        break myBigLoop
                    }
                }


            }
        }
    }

NSLog("end time2")

    routeArr = totalRouteSaveArr[myLoc]
    sLoc = sLocArr[myLoc]
    resultArr = saveArr[myLoc]
    combo = comboArr[myLoc]

    // 迴圈執行數目
    NSLog("self.totalCombo1 = \(combo)")
    NSLog("sloc = \(sLoc)")
    NSLog("step count = \(routeArr.count)")
    NSLog("step = \(routeArr)")
    NSLog("count = \(count)")

    // 重組後陣列
    NSLog("self.original Array2 = \n\(resultArr[0])\n\(resultArr[1])\n\(resultArr[2])\n\(resultArr[3])\n\(resultArr[4])")

    return (routeArr,sLoc,combo,resultArr)
}

private func aa(){

}
