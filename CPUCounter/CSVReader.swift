//
//  CSVReader.swift
//  CPUCounter
//
//  Created by Zenya Kirilov on 28.12.22.
//

import Foundation

func readDataFromCSV(fileName: String, fileType: String?, directory: String?) -> String? {
    guard let filepath = Bundle.main.path(forResource: fileName, ofType: fileType, inDirectory: directory) else {
        return nil
    }
    do {
        let contents = try String(contentsOfFile: filepath, encoding: .utf8)
        return contents
    } catch {
        print("File Read Error for file \(filepath)")
        return nil
    }
}

func csv(data: String) -> [[String]] {
    var result: [[String]] = []
    let rows = data.components(separatedBy: "\n")
    for row in rows {
        let columns = row.components(separatedBy: " ")
        result.append(columns)
    }
    return result
}
