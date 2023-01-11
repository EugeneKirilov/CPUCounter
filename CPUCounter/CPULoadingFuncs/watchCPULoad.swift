//
//  watchCPULoad.swift
//  CPUCounter
//
//  Created by Zenya Kirilov on 28.12.22.
//

import Foundation

func watchCPULoad() -> Bool{
    var input: String? = nil
    
    repeat {
        print(Constants.cpuRequest.rawValue)
        input = readLine()
    } while input ?? Constants.none.rawValue == ""
    || (input ?? Constants.none.rawValue).first != (input ?? Constants.none.rawValue).last
    || ![Constants.yes.rawValue,
         Constants.yes.rawValue.uppercased(),
         Constants.no.rawValue,
         Constants.no.rawValue.uppercased()].contains(input ?? Constants.none.rawValue)
    
    return input == Constants.yes.rawValue.uppercased() || input == Constants.yes.rawValue ? true : false
}
