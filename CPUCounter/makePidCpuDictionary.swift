//
//  makePidCpuDictionary.swift
//  CPUCounter
//
//  Created by Zenya Kirilov on 27.12.22.
//

import Foundation

var pids = [String]()
var cpus = [String]()
var pidCPUDictionary = [String: String]()

func makePidCpuDictionary() {
    do {
        try pids = safeShell("ps -eo pid").components(separatedBy: "\n").map {$0.trimmingCharacters(in: .whitespaces)}
        pids.removeFirst()
        print(pids)
    }
    catch let error {
        print(error.localizedDescription)
    }

    do {
        try cpus = safeShell("ps -eo %cpu").components(separatedBy: "\n").map { $0.trimmingCharacters(in: .whitespaces)}
        cpus.removeFirst()
        print(cpus)
    }
    catch let error {
        print(error.localizedDescription)
    }
    
    pidCPUDictionary = Dictionary(uniqueKeysWithValues: zip(pids, cpus))
}
