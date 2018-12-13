//
//  ComboCalFunc.swift
//  myMap
//
//  Created by Jim Chuang on 2017/9/14.
//  Copyright © 2017年 test. All rights reserved.
//

import Foundation

func comboCal (comboArray: [Array<Int>]) -> Int{

    var newArr:Array = comboArray
    var oriArr:Array = comboArray

    var totalCombo:Int = 0
    var combo:Int = 0

    repeat{
        combo = 0
        for h in 0...4{
            for w in 0...5{
                if oriArr[h][w] <= 5 && oriArr[h][w] >= 0{
                    (newArr,combo) = w <= (6-cleanLen) ? fillComplete(sH: h, sW: w, oriA: oriArr, newA: newArr, len: cleanLen, dir: "right", combo: combo) : (newArr, combo)
                    (newArr,combo) = h <= (5-cleanLen) ? fillComplete(sH: h, sW: w, oriA: oriArr, newA: newArr, len: cleanLen, dir: "down", combo: combo) : (newArr, combo)
                }
            }
        }
        // second cal after clear up
        totalCombo += combo
        oriArr = clearUp(originalArray: oriArr)
        newArr = oriArr
    } while combo >= 1 //second cal after clear up
    return totalCombo
}

func fillComplete(sH:Int,sW:Int,oriA:[Array<Int>],newA:[Array<Int>],len:Int,dir:String,combo:Int) -> (Array:[Array<Int>],Combo:Int){

    let ballNum = oriA[sH][sW]
    var resultA = newA
    var calCombo = combo
    var fullCondition = true
    switch dir{
    case "right":
        for x in 0...len-1{
            if oriA[sH][sW] == oriA[sH][sW+x] && newA[sH][sW+x] < CLEAN_NUMBER_OF_SPREAD{
            }else{
                fullCondition = false
            }
        }
        if fullCondition{
            calCombo += 1
            resultA = spread(arr: resultA, startH: sH, startW: sW, ballNum: ballNum)
        }

    case "down":
        for x in 0...len-1{
            if oriA[sH][sW] == oriA[sH+x][sW] && newA[sH+x][sW] < CLEAN_NUMBER_OF_SPREAD{
            }else{
                fullCondition = false
            }
        }
        if fullCondition{
            calCombo += 1
            resultA = spread(arr: resultA, startH: sH, startW: sW, ballNum: ballNum)
        }
    case "left":
        break
    case "up":
        break
    default:
        break
    }
    return (resultA,calCombo)
}

func spread(arr:[Array<Int>],startH:Int,startW:Int,ballNum:Int) -> [Array<Int>]{

    var resultArr = arr
    let h = arr[startH]

    let startWn1 = startW - 1
    let startWp1 = startW + 1

    let startHn1 = startH - 1
    let startHp1 = startH + 1

    resultArr[startH][startW] = ballNum + CLEAN_NUMBER_OF_SPREAD

    if let left = h[safe:startWn1]{
        if left == ballNum{
            resultArr[startH][startWn1] = ballNum + CLEAN_NUMBER_OF_SPREAD
            resultArr = spread(arr: resultArr, startH: startH, startW: startWn1, ballNum: ballNum)
        }
    }
    if let right = h[safe:startWp1]{
        if right == ballNum{
            resultArr[startH][startWp1] = ballNum + CLEAN_NUMBER_OF_SPREAD
            resultArr = spread(arr: resultArr, startH: startH, startW: startWp1, ballNum: ballNum)
        }
    }
    if let hUp = arr[safe:startHn1]{
        let up = hUp[startW]
        if up == ballNum{
            resultArr[startHn1][startW] = ballNum + CLEAN_NUMBER_OF_SPREAD
            resultArr = spread(arr: resultArr, startH: startHn1, startW: startW, ballNum: ballNum)
        }
    }
    if let hdown = arr[safe:startHp1]{
        let down = hdown[startW]
        if down == ballNum{
            resultArr[startHp1][startW] = ballNum + CLEAN_NUMBER_OF_SPREAD
            resultArr = spread(arr: resultArr, startH: startHp1, startW: startW, ballNum: ballNum)
        }
    }

    return resultArr
}

