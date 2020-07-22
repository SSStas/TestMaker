//
//  Tests.swift
//  TestMaker
//
//  Created by Mac on 18.07.2020.
//  Copyright © 2020 Apples. All rights reserved.
//

import Foundation
import UIKit

class TestsParameters {
    
    var searchedTests: [TestDescription]
    var query = ""
    
    init() {
        self.searchedTests = []
    }
    
    func getTestNumParam(_ index: Int, _ isGames: Bool) -> String {
        let num = (isGames ? self.searchedTests[index].games! : self.searchedTests[index].likes)
        switch num {
        case 1000..<1000000:
            return String(num / 1000) + "K"
        case 1000000..<1000000000:
            return String(num / 1000000) + "M"
        default:
            return String(num)
        }
    }
    
}
