//
//  main.swift
//  CPUCounter
//
//  Created by Zenya Kirilov on 27.12.22.
//

import Foundation
import Cocoa

// приветственные слова
printHelloAndAbout()
// сразу печатаем список запущенных программ
printRunningApplications()

// генерируем массив с данными из терминала для дальнейшего создания CSV
makeArrayForCSV()

// создание CSV на основе сгенерированного в предыдущей функции массива
createCSV(from: arrayForCSV)

// читаем данные из CSV
var data = readDataFromCSV(fileName: Constants.csvFileName.rawValue)
let csvRows = csv(data: data ?? Constants.none.rawValue)

// функция показа данных о загрузке процессора
showCPULoad(dataDictionary: csvRows)


