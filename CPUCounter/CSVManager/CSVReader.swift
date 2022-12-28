//
//  CSVReader.swift
//  CPUCounter
//
//  Created by Zenya Kirilov on 28.12.22.
//

import Foundation

func readDataFromCSV(fileName: String) -> String? {
    guard let dir = FileManager.default.urls(for: .documentDirectory, in: .allDomainsMask).first else {
        return nil
    }
    let fileURL = dir.appendingPathComponent(fileName)
    do {
        let contents = try String(contentsOf: fileURL, encoding: .utf8)
        return contents
    } catch {
        print("File Read Error for file \(fileName)")
        return nil
    }
}

func csv(data: String) -> [[String: String]] {
    var result: [[String: String]] = []
    let rows = data.components(separatedBy: "\n")
    for row in rows {
        let newRow = row.replacingOccurrences(of: " ", with: "")
        let columns = newRow.components(separatedBy: CharacterSet(charactersIn: ","))
        var dictionary = Dictionary<String, String>()
        dictionary.updateValue(columns.last ?? "no data",
                               forKey: columns[0])
        result.append(dictionary)
    }
    result.removeLast()
    return result
}
