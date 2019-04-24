//
//  Board.swift
//  myMap
//
//  Created by Jim Chuang on 2018/12/25.
//  Copyright © 2018 test. All rights reserved.
//

import Foundation

class Board {
    static let share = Board()

    private var userStep:Array<Array<Int>>? = nil
    private var autoStep:Array<Array<Int>>? = nil
    private var oriArr:Array<Array<Int>>? = nil
    private var resultArr:Array<Array<Int>>? = nil

    func setOriArr(arr:Array<Array<Int>>){
        oriArr = arr
    }

    func getOriArr() -> Array<Array<Int>>? {
        if let arr = oriArr{
            return arr
        }else{
            return nil
        }
    }

    func setUserStep(arr:[[Int]]){
        userStep = arr
    }

    func getUserStep() -> [[Int]]?{
        if let arr = userStep{
            return arr
        }else{
            return nil
        }
    }

    func setAutoStep(arr:[[Int]]){
        autoStep = arr
    }

    func getAutoStep() -> [[Int]]?{
        if let arr = autoStep{
            return arr
        }else{
            return nil
        }
    }
    

}
