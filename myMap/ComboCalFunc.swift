//
//  ComboCalFunc.swift
//  myMap
//
//  Created by Jim Chuang on 2017/9/14.
//  Copyright © 2017年 test. All rights reserved.
//

import Foundation

func comboCal (comboArray: [Array<Int>]) -> Int{

    var newA:Array = comboArray
    var oriA:Array = comboArray

    var totalCombo:Int = 0
    var combo:Int = 0

    repeat{
        combo = 0
        for h in 0...4{
            for w in 0...5{
                if oriA[h][w] <= 5 && oriA[h][w] >= 0{
                    (newA,combo) = w <= (6-cleanLen) ? fillComplete(sH: h, sW: w, oriA: oriA, newA: newA, len: cleanLen, dir: "right", combo: combo) : (newA, combo)
                    (newA,combo) = h <= (5-cleanLen) ? fillComplete(sH: h, sW: w, oriA: oriA, newA: newA, len: cleanLen, dir: "down", combo: combo) : (newA, combo)
                }
            }
        }
        totalCombo += combo
        oriA = clearUp(originalArray: oriA)
        newA = oriA
    } while combo >= 1
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
            resultA = spread(a: resultA, startH: sH, startW: sW, ballNum:   ballNum)
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
            resultA = spread(a: resultA, startH: sH, startW: sW, ballNum: ballNum)
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

func spread(a:[Array<Int>],startH:Int,startW:Int,ballNum:Int) -> [Array<Int>]{

    var result = a
    let h = a[startH]

    result[startH][startW] = ballNum + CLEAN_NUMBER_OF_SPREAD

    if let left = h[safe:startW-1]{
        if left == ballNum{
            result[startH][startW-1] = ballNum + CLEAN_NUMBER_OF_SPREAD
            result = spread(a: result, startH: startH, startW: startW-1, ballNum: ballNum)
        }
    }
    if let right = h[safe:startW+1]{
        if right == ballNum{
            result[startH][startW+1] = ballNum + CLEAN_NUMBER_OF_SPREAD
            result = spread(a: result, startH: startH, startW: startW+1, ballNum: ballNum)
        }
    }
    if let hUp = a[safe:startH-1]{
        let up = hUp[startW]
        if up == ballNum{
            result[startH-1][startW] = ballNum + CLEAN_NUMBER_OF_SPREAD
            result = spread(a: result, startH: startH-1, startW: startW, ballNum: ballNum)
        }
    }
    if let hdown = a[safe:startH+1]{
        let down = hdown[startW]
        if down == ballNum{
            result[startH+1][startW] = ballNum + CLEAN_NUMBER_OF_SPREAD
            result = spread(a: result, startH: startH+1, startW: startW, ballNum: ballNum)
        }
    }

    return result
}

