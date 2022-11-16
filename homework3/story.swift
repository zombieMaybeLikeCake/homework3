//
//  story.swift
//  homework3
//
//  Created by robert on 2022/11/16.
//

import Foundation
func add(num:Int) -> Int{
    var n:Int
    n=num+1
    return n
}
func first(num:Double,choose: inout [String] )->String {
    if(num<4){
        return choose[0]
    }
    else if(num<7){
        return choose[1]
    }
    else{
        return choose[2]
    }
}
var born=["出生在一個貧窮的鄉下人家",
         "出生在一個還過得去的小康家庭裡",
          "出生在一個富貴人家"]

