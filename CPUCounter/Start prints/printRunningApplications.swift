//
//  printRunningApplications.swift
//  CPUCounter
//
//  Created by Zenya Kirilov on 27.12.22.
//

import Foundation
import Cocoa

let workspace = NSWorkspace.shared
let activeAppsNames = workspace.runningApplications
    .filter { $0.activationPolicy == .regular }
    .map{($0.bundleIdentifier ?? "none")
    .components(separatedBy: ".").last ?? "none"}
let activeAppsPID = workspace.runningApplications
    .filter { $0.activationPolicy == .regular }
    .map{($0.processIdentifier)}

func printRunningApplications() {
    print("List of running programs: ")
    activeAppsNames.forEach { print($0.capitalized) }
    print()
}
