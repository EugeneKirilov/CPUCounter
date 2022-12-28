//
//  makePidCpuDictionary.swift
//  CPUCounter
//
//  Created by Zenya Kirilov on 27.12.22.
//

import Foundation

var pids = [String]()
var cpus = [String]()

var arrayForCSV: [Dictionary<String, String>] = Array()

func makeArrayForCSV() {
    do {
        try pids = safeShell("ps -eo pid").components(separatedBy: "\n").map { $0.trimmingCharacters(in: .whitespaces)}
    } catch let error {
        print(error.localizedDescription)
    }

    do {
        try cpus = safeShell("ps -eo %cpu").components(separatedBy: "\n").map { $0.trimmingCharacters(in: .whitespaces)}
    }
    catch let error {
        print(error.localizedDescription)
    }
    
    var index = 0
    for i in pids {
        var dct = Dictionary<String, String>()
        dct.updateValue(cpus[index], forKey: i)
        arrayForCSV.append(dct)
        index += 1
    }
    
    arrayForCSV.removeFirst()
    arrayForCSV.removeLast()
}

func createCSV(from recArray:[Dictionary<String, String>]) {
    var csvString = "\("PID"),\("%CPU")\n"
    for dct in recArray {
        csvString = csvString
            .appending("\((dct.keys).joined()) ,\((dct.values).joined())\n")
    }
    
    let fileManager = FileManager.default
    do {
        let path = try fileManager.url(for: .documentDirectory, in: .allDomainsMask, appropriateFor: nil, create: false)
        let fileURL = path.appendingPathComponent("CSVRec.csv")
        try csvString.write(to: fileURL, atomically: true, encoding: .utf8)
    } catch {
        print("error creating file")
    }
}
