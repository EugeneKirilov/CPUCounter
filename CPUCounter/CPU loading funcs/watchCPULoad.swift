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
        print()
        print("Do you want to see CPU loading for every program? (y/n)")
        input = readLine()
    } while input! == "" || input!.first != input!.last || !["y","Y","n","N"].contains(input!)
    return input == "Y" || input == "y" ? true : false
}
