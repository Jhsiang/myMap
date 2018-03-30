//
//  ComboCalFunc.swift
//  myMap
//
//  Created by Jim Chuang on 2017/9/14.
//  Copyright © 2017年 test. All rights reserved.
//

import Foundation

func comboCal (comboArray: [Array<Int>]) -> Int{

    let len = 3
    var newA:Array = comboArray
    var oriA:Array = comboArray

    var totalCombo:Int = 0
    var combo:Int = 0

    repeat{
        combo = 0
        for h in 0...4{
            for w in 0...5{
                switch oriA[h][w]{
                case 0:
                    (newA,combo) = w <= 3 ? fillComplete(sH: h, sW: w, oriA: oriA, newA: newA, len: len, dir: 1, combo: combo) : (newA, combo)
                    (newA,combo) = h <= 2 ? fillComplete(sH: h, sW: w, oriA: oriA, newA: newA, len: len, dir: 6, combo: combo) : (newA, combo)
                case 1:
                    (newA,combo) = w <= 3 ? fillComplete(sH: h, sW: w, oriA: oriA, newA: newA, len: len, dir: 1, combo: combo) : (newA, combo)
                    (newA,combo) = h <= 2 ? fillComplete(sH: h, sW: w, oriA: oriA, newA: newA, len: len, dir: 6, combo: combo) : (newA, combo)
                case 2:
                    (newA,combo) = w <= 3 ? fillComplete(sH: h, sW: w, oriA: oriA, newA: newA, len: len, dir: 1, combo: combo) : (newA, combo)
                    (newA,combo) = h <= 2 ? fillComplete(sH: h, sW: w, oriA: oriA, newA: newA, len: len, dir: 6, combo: combo) : (newA, combo)
                case 3:
                    (newA,combo) = w <= 3 ? fillComplete(sH: h, sW: w, oriA: oriA, newA: newA, len: len, dir: 1, combo: combo) : (newA, combo)
                    (newA,combo) = h <= 2 ? fillComplete(sH: h, sW: w, oriA: oriA, newA: newA, len: len, dir: 6, combo: combo) : (newA, combo)
                case 4:
                    (newA,combo) = w <= 3 ? fillComplete(sH: h, sW: w, oriA: oriA, newA: newA, len: len, dir: 1, combo: combo) : (newA, combo)
                    (newA,combo) = h <= 2 ? fillComplete(sH: h, sW: w, oriA: oriA, newA: newA, len: len, dir: 6, combo: combo) : (newA, combo)
                case 5:
                    (newA,combo) = w <= 3 ? fillComplete(sH: h, sW: w, oriA: oriA, newA: newA, len: len, dir: 1, combo: combo) : (newA, combo)
                    (newA,combo) = h <= 2 ? fillComplete(sH: h, sW: w, oriA: oriA, newA: newA, len: len, dir: 6, combo: combo) : (newA, combo)
                default:
                    break
                }
            }
        }
        totalCombo += combo
        oriA = clearUp(originalArray: oriA)
        newA = oriA
    } while combo >= 1
    return totalCombo
}

func fillComplete(sH:Int,sW:Int,oriA:[Array<Int>],newA:[Array<Int>],len:Int,dir:Int,combo:Int) -> (Array:[Array<Int>],Combo:Int){

    let ballNum = oriA[sH][sW]
    var resultA = newA
    var calCombo = combo
    switch dir{
    case 1:
        if oriA[sH][sW] == oriA[sH][sW+1] && oriA[sH][sW] == oriA[sH][sW+2]{
            if newA[sH][sW] < 60 && newA[sH][sW+1] < 60 && newA[sH][sW+2] < 60{
                calCombo += 1
                resultA = spread(a: resultA, startH: sH, startW: sW, ballNum: ballNum)
            }
        }
    case 6:
        if oriA[sH][sW] == oriA[sH+1][sW] && oriA[sH][sW] == oriA[sH+2][sW]{
            if newA[sH][sW] < 60 && newA[sH+1][sW] < 60 && newA[sH+2][sW] < 60{
                calCombo += 1
                resultA = spread(a: resultA, startH: sH, startW: sW, ballNum: ballNum)
            }
        }
    case -1:
        break
    case -6:
        break
    default:
        break
    }
    return (resultA,calCombo)
}

func spread(a:[Array<Int>],startH:Int,startW:Int,ballNum:Int) -> [Array<Int>]{

    var result = a
    let h = a[startH]

    result[startH][startW] = ballNum + 60

    if let left = h[safe:startW-1]{
        if left == ballNum{
            result[startH][startW-1] = ballNum + 60
            result = spread(a: result, startH: startH, startW: startW-1, ballNum: ballNum)
        }
    }
    if let right = h[safe:startW+1]{
        if right == ballNum{
            result[startH][startW+1] = ballNum + 60
            result = spread(a: result, startH: startH, startW: startW+1, ballNum: ballNum)
        }
    }
    if let hUp = a[safe:startH-1]{
        let up = hUp[startW]
        if up == ballNum{
            result[startH-1][startW] = ballNum + 60
            result = spread(a: result, startH: startH-1, startW: startW, ballNum: ballNum)
        }
    }
    if let hdown = a[safe:startH+1]{
        let down = hdown[startW]
        if down == ballNum{
            result[startH+1][startW] = ballNum + 60
            result = spread(a: result, startH: startH+1, startW: startW, ballNum: ballNum)
        }
    }

    return result
}

