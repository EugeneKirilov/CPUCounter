//
//  printRunningApplications.swift
//  CPUCounter
//
//  Created by Zenya Kirilov on 27.12.22.
//

import Foundation
import Cocoa

func calculateActiveAppsNames() -> [String] {
    NSWorkspace.shared.runningApplications.filter { $0.activationPolicy == .regular }.map{ ($0.bundleIdentifier ?? Constants.none.rawValue).components(separatedBy: Constants.dotSeparator.rawValue).last ?? Constants.none.rawValue }
}

func calculateActiveAppsPID() -> [pid_t] {
    NSWorkspace.shared.runningApplications.filter { $0.activationPolicy == .regular }.map{ ($0.processIdentifier) }
}

let activeAppsNames = calculateActiveAppsNames()
let activeAppsPID = calculateActiveAppsPID()

func printRunningApplications() {
    print(Constants.runningProgramList.rawValue)
    activeAppsNames.forEach { print($0.capitalized, terminator: Constants.emptyStringSeparator.rawValue) }
}
