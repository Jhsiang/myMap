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
                if 0...5 ~= oriArr[h][w] && newArr[h][w] != DISABLE_BALL_NUMBER {
                    if w <= (6 - cleanLen) && newArr[h][w+1] != DISABLE_BALL_NUMBER && newArr[h][w+2] != DISABLE_BALL_NUMBER{
                        (newArr,combo) = fillComplete(sH: h, sW: w, oriA: oriArr, newA: newArr, len: cleanLen, dir: "right", combo: combo)
                    }
                    if h <= (5-cleanLen) && newArr[h+1][w] != DISABLE_BALL_NUMBER && newArr[h+2][w] != DISABLE_BALL_NUMBER{
                        (newArr,combo) = fillComplete(sH: h, sW: w, oriA: oriArr, newA: newArr, len: cleanLen, dir: "down", combo: combo)
                    }
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

    switch dir{
    case "right":
        for x in 0..<len{
            if oriA[sH][sW] != oriA[sH][sW+x]{
                return (resultA,calCombo)
            }
        }
            calCombo += 1
            resultA = spread(arr: resultA, startH: sH, startW: sW, ballNum: ballNum)

    case "down":
        for x in 0..<len{
            if oriA[sH][sW] != oriA[sH+x][sW]{
                return (resultA,calCombo)
            }
        }

        calCombo += 1
        resultA = spread(arr: resultA, startH: sH, startW: sW, ballNum: ballNum)

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

    resultArr[startH][startW] = DISABLE_BALL_NUMBER

    if let left = h[safe:startWn1]{
        if left == ballNum{
            resultArr[startH][startWn1] = DISABLE_BALL_NUMBER
            resultArr = spread(arr: resultArr, startH: startH, startW: startWn1, ballNum: ballNum)
        }
    }
    if let right = h[safe:startWp1]{
        if right == ballNum{
            resultArr[startH][startWp1] = DISABLE_BALL_NUMBER
            resultArr = spread(arr: resultArr, startH: startH, startW: startWp1, ballNum: ballNum)
        }
    }
    if let hUp = arr[safe:startHn1]{
        let up = hUp[startW]
        if up == ballNum{
            resultArr[startHn1][startW] = DISABLE_BALL_NUMBER
            resultArr = spread(arr: resultArr, startH: startHn1, startW: startW, ballNum: ballNum)
        }
    }
    if let hdown = arr[safe:startHp1]{
        let down = hdown[startW]
        if down == ballNum{
            resultArr[startHp1][startW] = DISABLE_BALL_NUMBER
            resultArr = spread(arr: resultArr, startH: startHp1, startW: startW, ballNum: ballNum)
        }
    }

    return resultArr
}

