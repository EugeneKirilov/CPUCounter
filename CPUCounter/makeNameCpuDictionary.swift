//
//  makeNameCpuDictionary.swift
//  CPUCounter
//
//  Created by Zenya Kirilov on 27.12.22.
//

import Foundation

var nameCpuDictionary = [String: String]()

func makeNameCpuDictionary() {
    makePidCpuDictionary()
    
    var currentCpuArray = [String]()
    
    for i in pids {
        currentCpuArray.append(pidCPUDictionary[i] ?? "no data")
    }
    
    nameCpuDictionary = Dictionary(uniqueKeysWithValues: zip(activeAppsNames, currentCpuArray))
}
