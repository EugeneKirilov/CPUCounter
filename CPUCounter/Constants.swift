//
//  Constants.swift
//  CPUCounter
//
//  Created by Zenya Kirilov on 10.01.23.
//

import Foundation

enum Constants: String {
    case none
    case dotSeparator = "."
    case hyphenSeparator = " - "
    case comma = ","
    case emptyStringSeparator = "\n"
    case runningProgramList = "List of running programs: "
    case filePath = "/bin/zsh"
    case noData = "no data"
    case cOption = "-c"
    case psPidCommand = "ps -eo pid"
    case psCPUCommand = "ps -eo %cpu"
    case pidHeader = "PID"
    case cpuHeader = "%CPU"
    case csvFileName = "CSVRec.csv"
    case fileReadError = "File Read Error for file "
    case cpuRequest = "\nDo you want to see CPU loading for every program? (y/n)"
    case yes = "y"
    case no = "n"
    case finalMessage = "Thanks for using our app. See you later!"
}
