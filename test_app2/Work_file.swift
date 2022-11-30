//
//  File.swift
//  test_app2
//
//  Created by Ruslan on 30.11.22.
//

import Foundation

let argv = CommandLine.arguments

func version_application() {
    
    
    if argv.count == 1 {
        
        NSLog("Ошибка, вы не ввели параметры")
        
        exit(1)
    }

    if argv.count == 2 {
        
        NSLog("Вы ввели только один аргумент для сравнения")
        
        exit(2)
    }

    if argv.count > 3 {
        
        NSLog("Вы ввели больше двух номеров")
        
        exit(3)
    }

    let versionNumber_1 = VersionNumber.init(numberString: argv[1])
    let versionNumber_2 = VersionNumber.init(numberString: argv[2])

    if versionNumber_1 == versionNumber_2 {
        
        print("Номера совпадают")
    } else {
        if versionNumber_1 > versionNumber_2 {
            
            print(versionNumber_1,">",versionNumber_2)
            
        } else {
            
            print(versionNumber_2,">",versionNumber_1)
        }
    }
}
