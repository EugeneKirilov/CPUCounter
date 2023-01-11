//
//  showCPULoad.swift
//  CPUCounter
//
//  Created by Zenya Kirilov on 28.12.22.
//

import Foundation

@discardableResult
func makeCPUString(forString: String, dataDictionary: [[String : String]], pid: pid_t) -> String {
    forString.capitalized
    + Constants.hyphenSeparator.rawValue
    + String(describing: dataDictionary.filter { $0[String(pid)] != nil }.first?.values.joined() ?? Constants.noData.rawValue)
}

func showCPULoad(dataDictionary: [[String: String]]) {
    if watchCPULoad() {
        for (index, currentPid) in activeAppsPID.enumerated() {
            print(makeCPUString(forString: activeAppsNames[index], dataDictionary: dataDictionary, pid: currentPid))
        }
    } else {
        print(Constants.finalMessage.rawValue)
    }
}
