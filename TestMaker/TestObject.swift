//
//  TestObject.swift
//  TestMaker
//
//  Created by Mac on 13.07.2020.
//  Copyright © 2020 Apples. All rights reserved.
//

import Foundation
import UIKit

struct User: Decodable {
    var login: String
    var password: String
    var id: String
}

struct Author: Decodable {
    var name: String
    var id: String
}

struct TestDescription: Decodable {
    var title: String
    var description: String
    var isGlobal: Bool
    var author: Author
    var games: Int
    var likes: Int
    var id: String
    var questions: [Question]?
}

struct ContentDescription: Decodable {
    var tests: [TestDescription]
}

struct Members: Decodable {
    var users: [User]
}

struct Question: Decodable {
    var question: String
    var answers: [String]
    var correct: [String]
}
