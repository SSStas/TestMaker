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
    var name: String?
    var login: String?
    var password: String?
    var id: String
}

struct Question: Decodable {
    var question: String
    var answers: [String]   // создать массив кортежев (String, Bool) <=> (ответ, его корректность)
    var correct: String     // убрать по возможности
    //var imageURL: String?      // добавить в api
}

struct Test: Decodable {
    var title: String
    var author: User
    var questions: [Question]
}

struct Content: Decodable {
    var tests: [Test]
}

struct Members: Decodable {
    var users: [User]
}
