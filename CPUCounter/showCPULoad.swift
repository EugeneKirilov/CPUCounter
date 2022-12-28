//
//  showCPULoad.swift
//  CPUCounter
//
//  Created by Zenya Kirilov on 28.12.22.
//

import Foundation

func showCPULoad(dataDictionary: [[String: String]]) {
    if watchCPULoad() {
        var index = 0
        for currentPid in activeAppsPID {
            
            print(activeAppsNames[index].capitalized
                  +  " - "
                  + String(describing: dataDictionary
                    .filter { $0[String(currentPid)] != nil }
                    .first?.values.joined() ?? "no data"))
            
            index += 1
        }
    } else {
        print("Thanks for using our app. See you later!")
    }
}
