//
//  CSVReader.swift
//  CPUCounter
//
//  Created by Zenya Kirilov on 28.12.22.
//

import Foundation

func readDataFromCSV(fileName: String) -> String? {
    guard let directory = FileManager.default.urls(for: .documentDirectory, in: .allDomainsMask).first else {
        return nil
    }
    
    let fileURL = directory.appendingPathComponent(fileName)
    
    do {
        let contents = try String(contentsOf: fileURL, encoding: .utf8)
        return contents
    } catch {
        print(Constants.fileReadError.rawValue + fileName)
        return nil
    }
}

func csv(data: String) -> [[String: String]] {
    var result: [[String: String]] = []
    let rows = data.components(separatedBy: Constants.emptyStringSeparator.rawValue)
    
    for row in rows {
        let newRow = row.replacingOccurrences(of: " ", with: "")
        let columns = newRow.components(separatedBy: CharacterSet(charactersIn: Constants.comma.rawValue))
        var dictionary = Dictionary<String, String>()
        dictionary.updateValue(columns.last ?? Constants.noData.rawValue, forKey: columns[0])
        result.append(dictionary)
    }
    
    result.removeLast()
    return result
}
