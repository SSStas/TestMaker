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
    func getTestsDescriptions(query: String = "", count: Int = 30, completion: @escaping ([TestDescription]) -> Void) {
        
        let fullURL = url + "/tests" + (query == "" ? "" : "/\(query.encodeUrl)/\(count)")
        
        AF.request(fullURL, method: .get, encoding: URLEncoding.default)
        .responseDecodable(of: ContentDescription.self)
        { /*[weak self]*/ response in
            switch response.result {
                case .failure(let err):
                    print("***")
                    print(err)
            case .success(let res):
                completion(res.tests)
            }
        }
    }
    
    /// Gets a full test information with a specific id
    func getFullTest(id: String, completion: @escaping (TestDescription) -> Void) {
        
        let fullURL = url + "/test/\(id)"
        
        AF.request(fullURL, method: .get, encoding: URLEncoding.default)
        .responseDecodable(of: TestDescription.self)
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
        
        let fullURL = url + "/signin/\(login.encodeUrl)/\(password)"
        
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
    
    private func UnsafeSignUp(login: String, password: String, completion: @escaping () -> Void) {
        let params: [String: Any] = [
            "login": login,
            "password": self.md5(password)
        ]
        let fullURL = url + "/registrate"
        
        AF.request(fullURL, method: .put, parameters: params, encoding: JSONEncoding.default).responseJSON
        { response in
            switch response.result {
            case .success(let res):
                print(res)
                completion()
            case .failure(let err):
                print(err)
            }
        }
    }
    
    /// Signs up a new user
    func signUp(login: String, password: String, completion: @escaping (Bool) -> Void) {
        self.getUsers(completion: {users in
            for user in users where user.login == login {
                completion(false)
                return
            }
            self.UnsafeSignUp(login: login, password: password, completion: {
                completion(true)
            })
        })
    }
    
    /// Creates a new test
    func createNewTest(testDescription: TestDescription) {
        var questionsArr = [[String : Any]]()
        for q in testDescription.questions ?? [] {
            questionsArr.append(["question" : q.question, "answers" : q.answers, "correct" : q.correct])
        }
        let params: [String: Any] = [
            "title": testDescription.title,
            "description": testDescription.description,
            "code": testDescription.code,
            "author": ["name": testDescription.author.name, "id": testDescription.author.id],
            "questionsCount": questionsArr.count,
            "questions" : questionsArr,
            "games": 0,
            "likes": 0
        ]
        let fullURL = url + "/addtest"
        
        AF.request(fullURL, method: .put, parameters: params, encoding: JSONEncoding.default).responseJSON
        { response in
            switch response.result {
            case .success(let res):
                print(res)
            case .failure(let err):
                print(err)
            }
        }
    }
    
}

extension String{
    var encodeUrl : String
    {
        return self.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
    }
    var decodeUrl : String
    {
        return self.removingPercentEncoding!
    }
}
