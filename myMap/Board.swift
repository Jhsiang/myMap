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

    

}
