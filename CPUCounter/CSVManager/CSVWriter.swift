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

func getPidsAndCpus() {
    do {
        try pids = safeShell(Constants.psPidCommand.rawValue).components(separatedBy: Constants.emptyStringSeparator.rawValue).map { $0.trimmingCharacters(in: .whitespaces) }
        try cpus = safeShell(Constants.psCPUCommand.rawValue).components(separatedBy: Constants.emptyStringSeparator.rawValue).map { $0.trimmingCharacters(in: .whitespaces) }
    } catch let error {
        print(error.localizedDescription)
    }
}

func makeArrayForCSV() {
    getPidsAndCpus()
    
    for (i, currentPid) in pids.enumerated() {
        var dct = Dictionary<String, String>()
        dct.updateValue(cpus[i], forKey: currentPid)
        arrayForCSV.append(dct)
    }
    
    arrayForCSV.removeFirst()
    arrayForCSV.removeLast()
}

func createCSVFile(stringCSV: String) {
    do {
        let path = try FileManager.default.url(for: .documentDirectory, in: .allDomainsMask, appropriateFor: nil, create: false)
        let fileURL = path.appendingPathComponent(Constants.csvFileName.rawValue)
        try stringCSV.write(to: fileURL, atomically: true, encoding: .utf8)
    } catch let error {
        print(error.localizedDescription)
    }
}

func createCSV(from recArray:[Dictionary<String, String>]) {
    var csvString = "\(Constants.pidHeader.rawValue),\(Constants.cpuHeader.rawValue)" + Constants.emptyStringSeparator.rawValue
    for dct in recArray {
        csvString = csvString.appending("\((dct.keys).joined()) ,\((dct.values).joined())" + Constants.emptyStringSeparator.rawValue)
    }
    
    createCSVFile(stringCSV: csvString)
}
