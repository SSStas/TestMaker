//
//  TestsAPI.swift
//  TestMaker
//
//  Created by Mac on 13.07.2020.
//  Copyright © 2020 Apples. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import CryptoKit

class TestsAPI {
    let url = "https://testmakerapi.herokuapp.com"
    
    func md5(_ text: String) -> String {
        let str = Insecure.MD5.hash(data: text.data(using: .utf8)!).description
        let index = str.index(str.endIndex, offsetBy: 12 - str.count)
        return String(str.suffix(from: index))
    }
    
    /// Gets list of all tests from specific user or from everyone
    func getTests(uid: String = "", completion: @escaping ([Test]) -> Void) {
        
        let fullURL = url + "/tests" + (uid == "" ? "" : "/user/\(uid)")
        
        AF.request(fullURL, method: .get, encoding: URLEncoding.default)
        .responseDecodable(of: Content.self)
        { /*[weak self]*/ response in
            switch response.result {
                case .failure(let err):
                    print(err)
            case .success(let res):
                completion(res.tests)
            }
        }
    }
    
    /// Gets a test with a specific id
    func getTest(id: String, completion: @escaping (Test) -> Void) {
        
        let fullURL = url + "/test/\(id)"
        
        AF.request(fullURL, method: .get, encoding: URLEncoding.default)
        .responseDecodable(of: Test.self)
        { /*[weak self]*/ response in
            switch response.result {
                case .failure(let err):
                    print(err)
            case .success(let res):
                completion(res)
            }
        }
    }
    
    /// Gets list of all users
    func getUsers(completion: @escaping ([User]) -> Void) {
        
        let fullURL = url + "/users"
        
        AF.request(fullURL, method: .get, encoding: URLEncoding.default)
        .responseDecodable(of: Members.self)
        { /*[weak self]*/ response in
            switch response.result {
                case .failure(let err):
                    print(err)
                case .success(let res):
                    completion(res.users)
            }
        }
    }
    
    /// Signs in an existing user
    func signIn(login: String, password: String, completion: @escaping (String) -> Void) {
        
        let fullURL = url + "/signin/\(login)/\(password)"
        
        AF.request(fullURL, method: .get, encoding: JSONEncoding.default).validate(statusCode: 200..<300).responseString
        { response in
            switch response.result {
            case .success(let res):
                completion(res)
            case .failure(let err):
                print(err)
            }
        }
    }
    
    /// Signs up a new user
    func signUp(login: String, password: String) {
        let params: [String: Any] = [
            "login": login,
            "password": self.md5(password)
        ]
        let fullURL = url + "/registrate"
        
        AF.request(fullURL, method: .put, parameters: params, encoding: JSONEncoding.default).responseJSON
        { response in
            switch response.result {
            case .success(let value):
                print(value)
            case .failure(let err):
                print(err)
            }
        }
    }
    
    /// Creates a new test
    func createNewTest(title: String, author: User, questions: [Question]) {
        var questionsArr = [[String : Any]]()
        for q in questions {
            questionsArr.append(["question" : q.question, "answers" : q.answers, "correct" : q.correct])
        }
        let params: [String: Any] = [
            "title": title,
            "author": ["name": author.name ?? "anonymous", "id": author.id],
            "questions" : questionsArr
        ]
        let fullURL = url + "/addtest"
        
        AF.request(fullURL, method: .put, parameters: params, encoding: JSONEncoding.default).responseJSON
        { response in
            switch response.result {
            case .success(let value):
                print(value)
            case .failure(let err):
                print(err)
            }
        }
    }
    
    /// Функция для тестирования класса TestAPI
    func forTestAPI() {
        func printLine() {
            print("----------------")
        }
        
        self.getTests() { t in
            for i in t {
                print("\(i.title) by \(i.author.name ?? "anonymous") <\(i.author.id)>")
                for q in i.questions {
                    printLine()
                    print(q.question)
                    printLine()
                    for j in q.answers {
                        print(j)
                    }
                    print("Correct answer: \(q.correct)")
                }
            }
        }
        
    }
    //
    
}
