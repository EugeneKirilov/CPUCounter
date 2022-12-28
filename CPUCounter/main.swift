//
//  main.swift
//  CPUCounter
//
//  Created by Zenya Kirilov on 27.12.22.
//

/* Реализовать приложение (консольное), которое будет брать запущенные пользователем программы в OS (типо chrome, telegram, sourcetree и тд) и выводить процентное значение загрузки этими приложениями CPU. */

import Foundation
import Cocoa

printHelloAndAbout()

printRunningApplications()

makeArrayForCSV()

createCSV(from: arrayForCSV)
//var data = readDataFromCSV(fileName: "output.csv", fileType: "csv", directory: "CPUCounter")
//let csvRows = csv(data: data ?? "none")
//print(csvRows[1][1])


