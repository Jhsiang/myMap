//
//  RotationAlgorithm.swift
//  myMap
//
//  Created by Jim Chuang on 2018/5/23.
//  Copyright © 2018年 test. All rights reserved.
//

import Foundation
//MARK: - 1
func rotationFunc(inputArray:Array<Array<Int>>) -> (routeArr:Array<Int>,sLoc:Int,combo:Int,resultArr:Array<Array<Int>>)
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
    var routeSave:Array<Int> = [] // 暫存路徑
    var totalRouteSave:Array<Int> = [] // 完整路徑
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

/*
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
*/
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

//MARK: - 2
func rotAlgo(inputArray:Array<Array<Int>>) -> (routeArr:Array<Int>,sLoc:Int,combo:Int,resultArr:Array<Array<Int>>){

    // result
    var routeArr = Array<Int>()
    var sLoc = 0
    var combo = 0
    var resultArr = Array<Array<Int>>()

    // data
    resultArr = inputArray

    // data2
    var saveArr = [Array<Array<Int>>]()
    var sLocArr = Array<Int>()
    var nextLocArr = Array<Int>()
    var totalRouteSaveArr = Array<Array<Int>>()
    var comboArr = Array<Int>()

    // cal
    //let sRandArr = [0,5,24,29]
    var count = 0

    NSLog("Start time1")
    myBigLoop:while combo < TARGET_COMBO_NUMBERS {

        // 開始位置
        if saveArr.count < 8{
        sLoc = Int.random(in: 0..<30)//sRandArr.randomElement()!

        let aa = startRotation(originalArray: inputArray, startLocation: sLoc, stepFrom: 8, stepTo: 9) //step 6 ~ 15 every 700count
        count += 1
        combo = comboCal(comboArray: aa.resultArr)

        if combo > 2{
            sLocArr.append(sLoc)
            nextLocArr.append(aa.nowLoc)
            saveArr.append(aa.resultArr)
            totalRouteSaveArr.append(aa.routeSave)
            comboArr.append(combo)

            // Debug
            /*
            for loc in 0..<totalRouteSaveArr.count{
                print("com = \(comboArr[loc]) rout = \(totalRouteSaveArr[loc]) sLoc = \(sLocArr[loc]) ")
                simResultArr(route: totalRouteSaveArr[loc], startLoc: sLocArr[loc])
            }
            */
        }
        }

            for x in 0..<saveArr.count{
                let bb = startRotation(originalArray: saveArr[x], startLocation: nextLocArr[x], stepFrom: 4, stepTo: 7)
                let combo = comboCal(comboArray: bb.resultArr)

                count += 1
                if count >= 10000{
                    break myBigLoop
                }

                if combo > comboArr[x]{
                    saveArr[x] = bb.resultArr
                    nextLocArr[x] = bb.nowLoc

                    for y in bb.routeSave{
                        totalRouteSaveArr[x].append(y)
                    }
                    comboArr[x] = combo

                    if combo >= TARGET_COMBO_NUMBERS{
                        break myBigLoop
                    }

                }
            }

    }
    NSLog("end time2")

    var newArrLocArr = Array<Int>()
    for i in 0...TARGET_COMBO_NUMBERS{
        if newArrLocArr.count == 0 {
            for loc in 0..<comboArr.count{
                if comboArr[loc] >= TARGET_COMBO_NUMBERS - i{
                    newArrLocArr.append(loc)
                }
            }
        }
    }

    print("full condition count = ",newArrLocArr.count)

    var step = 60
    var myMinStepLoc = 0
    for fullConditionLoc in newArrLocArr{
        NSLog("full con total step arr = \(totalRouteSaveArr[fullConditionLoc].count)")
        if totalRouteSaveArr[fullConditionLoc].count <= step{
            step = totalRouteSaveArr[fullConditionLoc].count
            myMinStepLoc = fullConditionLoc
        }
    }

    routeArr = totalRouteSaveArr[myMinStepLoc]
    sLoc = sLocArr[myMinStepLoc]
    resultArr = saveArr[myMinStepLoc]
    combo = comboArr[myMinStepLoc]

    // 迴圈執行數目
    NSLog("sav arr = \(saveArr.count)")
    NSLog("self.totalCombo1 = \(combo)")
    NSLog("sloc = \(sLoc)")
    NSLog("step count = \(routeArr.count)")
    NSLog("step = \(routeArr)")
    NSLog("count = \(count)")


    // Temp
    var tempTest = sLoc
    for x in routeArr{
        tempTest += x
    }
    NSLog("finial Loc = \(tempTest)")

    // 重組後陣列
    NSLog("self.original Array2 = \n\(resultArr[0])\n\(resultArr[1])\n\(resultArr[2])\n\(resultArr[3])\n\(resultArr[4])\n")
    simResultArr(arr:inputArray,route: routeArr, startLoc: sLoc)
    return (routeArr,sLoc,combo,resultArr)
}

private func sumArr(a:Array<Int>) -> Int{
    var sum = 0
    for x in a{
        sum += x
    }
    return sum
}

func simResultArr(arr:Array<Array<Int>>,route:Array<Int>,startLoc:Int){
    var resultArr = arr

    var start = startLoc

    for x in route{
        let next = start + x

        let nowH = start / 6
        let nowW = start % 6

        let nextH = next / 6
        let nextW = next % 6

        let swapValue = resultArr[nowH][nowW]
        resultArr[nowH][nowW] = resultArr[nextH][nextW]
        resultArr[nextH][nextW] = swapValue
        start = next
    }
    for x in resultArr{
        print(x)
    }
    print("c = ",comboCal(comboArray: resultArr))
}

