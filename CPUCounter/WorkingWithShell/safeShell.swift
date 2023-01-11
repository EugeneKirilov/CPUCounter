//
//  safeShell.swift
//  CPUCounter
//
//  Created by Zenya Kirilov on 27.12.22.
//
import Foundation

@discardableResult
func safeShell(_ command: String) throws -> String {
    let task = Process()
    let pipe = Pipe()
    
    task.standardOutput = pipe
    task.standardError = pipe
    task.arguments = [Constants.cOption.rawValue, command]
    task.executableURL = URL(fileURLWithPath: Constants.filePath.rawValue)
    task.standardInput = nil

    try task.run()
    
    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    let output = String(data: data, encoding: .utf8) ?? Constants.noData.rawValue
    
    return output
}
