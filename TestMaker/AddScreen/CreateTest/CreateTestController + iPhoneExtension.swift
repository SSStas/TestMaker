//
//  CreateTestController + iPhoneExtension.swift
//  TEstaddScreen
//
//  Created by Чурсина Юлия on 20.07.2020.
//  Copyright © 2020 Julia. All rights reserved.
//

import UIKit

extension CreateTestController {
    
    private func setupScroll() {
        
        iphoneScrollView.translatesAutoresizingMaskIntoConstraints = false
        iphoneContentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(iphoneScrollView)
        iphoneScrollView.addSubview(iphoneContentView)
        
        NSLayoutConstraint.activate([
            iphoneScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            iphoneScrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            iphoneScrollView.topAnchor.constraint(equalTo: view.topAnchor),
            iphoneScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
        
        NSLayoutConstraint.activate([
            iphoneContentView.centerXAnchor.constraint(equalTo: iphoneScrollView.centerXAnchor),
            iphoneContentView.widthAnchor.constraint(equalTo: iphoneScrollView.widthAnchor),
            iphoneContentView.topAnchor.constraint(equalTo: iphoneScrollView.topAnchor),
            iphoneContentView.bottomAnchor.constraint(equalTo: iphoneScrollView.bottomAnchor)
        ])
    }
    
    private func setupNewQuestion() {
        addQuestion.translatesAutoresizingMaskIntoConstraints = false
        
        iphoneContentView.addSubview(addQuestion)
        
        NSLayoutConstraint.activate([
            addQuestion.topAnchor.constraint(equalTo: iphoneContentView.topAnchor, constant: 30),
            addQuestion.centerXAnchor.constraint(equalTo: iphoneContentView.centerXAnchor),
            addQuestion.widthAnchor.constraint(equalTo: iphoneContentView.widthAnchor),
            addQuestion.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    private func setupOptions() {
        
        addOptions.translatesAutoresizingMaskIntoConstraints = false
        iphoneContentView.addSubview(addOptions)
        
        NSLayoutConstraint.activate([
            addOptions.topAnchor.constraint(equalTo: addQuestion.bottomAnchor, constant: 30),
            addOptions.centerXAnchor.constraint(equalTo: iphoneContentView.centerXAnchor),
            addOptions.widthAnchor.constraint(equalTo: iphoneContentView.widthAnchor),
            addOptions.heightAnchor.constraint(equalToConstant: 370)
        ])
    }
    
    func setupEmptyView() {
        
        let emptyView = UIView()
        
        iphoneContentView.addSubview(emptyView)
        emptyView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            emptyView.centerXAnchor.constraint(equalTo: iphoneContentView.centerXAnchor),
            emptyView.topAnchor.constraint(equalTo: addOptions.bottomAnchor, constant: 25),
            emptyView.widthAnchor.constraint(equalTo: iphoneContentView.widthAnchor),
            emptyView.bottomAnchor.constraint(equalTo: iphoneContentView.bottomAnchor),
            emptyView.heightAnchor.constraint(equalToConstant: view.frame.height / 3)
        ])
    }
    
    func setupIphoneViews() {
        
        setupScroll()
        setupNewQuestion()
        setupOptions()
        setupEmptyView()
    }
}
