//
//  Version_Checker.swift
//  test_app2
//
//  Created by Ruslan on 30.11.22.
//

import Foundation

public class VersionNumber {
    private var number: [Int] = []
    private func correctNumberTest(_ str: String) -> Bool {
        for char in str {
            if !char.isNumber && (char != ".") {
                return false
            }
        }
        return true
    }

    public init(numberString: String) {
        if !correctNumberTest(numberString) || numberString.isEmpty {
            NSLog("Некорректная строка")
            exit(0)
        } else {
            stringPars(numberString)
            self.zeroRemove()
        }
    }

    private func stringPars(_ str: String) {
        var index = 0
        while !str[str.index(str.startIndex, offsetBy: index)].isNumber && (index < str.count) {
            self.number.append(0)
            index += 1
        }
        let nums = str.split(separator: ".")
        for sub in nums {
            self.number.append(Int(String(sub))!)
        }
    }

    private func zeroRemove() {
        if !self.number.isEmpty {
            while self.number.last! == 0 {
                self.number.removeLast()
            }
        }
    }

}

extension VersionNumber {
    static func ==(left: VersionNumber, right: VersionNumber) -> Bool {
        if left.number.count != right.number.count {
            return false
        } else {
            var response: Bool = true
            var index = 0
            while response && (index < left.number.count) {
                if left.number[index] != right.number[index] {
                    response = false
                } else {
                    index += 1
                }
            }
            return response
        }
    }

    static func >(left: VersionNumber, right: VersionNumber) -> Bool {
        let count = left.number.count < right.number.count ? left.number.count : right.number.count
        var response = 0
        var index = 0
        while (response == 0) && (index < count) {
            if left.number[index] > right.number[index] {
                response = 1
            } else if left.number[index] < right.number[index] {
                response = -1
            } else {
                index += 1
            }
        }
        if response == 1 {
            return true
        } else if response == -1 {
            return false
        } else {
            if left.number.count == right.number.count {
                return false
            } else if count == right.number.count {
                return true
            } else {
                return false
            }
        }
    }

    static func <(left: VersionNumber, right: VersionNumber) -> Bool {
        let count = left.number.count < right.number.count ? left.number.count : right.number.count
        var response = 0
        var index = 0
        while (response == 0) && (index < count) {
            if left.number[index] < right.number[index] {
                response = 1
            } else if left.number[index] > right.number[index] {
                response = -1
            } else {
                index += 1
            }
        }
        if response == 1 {
            return true
        } else if response == -1 {
            return false
        } else {
            if left.number.count == right.number.count {
                return false
            } else if count == right.number.count {
                return false
            } else {
                return true
            }
        }
    }
}

