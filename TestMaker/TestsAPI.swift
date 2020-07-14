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

class TestsAPI {
    let url = "https://testmakerapi.herokuapp.com"
    
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
    
    
    func signIn(login: String, password: String, completion: @escaping (String) -> Void) {
        
        let fullURL = url + "/signin"
        
        AF.request(fullURL, method: .get).authenticate(username: login, password: password).validate(statusCode: 200..<300).response
        { response in
            switch response.result {
            case .success(let res):
                completion(String(data: res!, encoding: .utf8) ?? "not exist")
            case .failure(let err):
                print("***")
                print(err)
            }
        }
    }
    
    /// Creats a new user
    func signUp(login: String, password: String) {
        let params: [String: Any] = [
            "login": login,
            "password": password
        ]
        let fullURL = url + "/registrate"
        
        AF.request(fullURL, method: .put, parameters: params, encoding: JSONEncoding.default).responseJSON
        { response in
            switch response.result {
            case .success(let value):
                print(value)
            case .failure(let error):
                print(error)
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
            case .failure(let error):
                print(error)
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
