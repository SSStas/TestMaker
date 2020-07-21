//
//  AddTestController + iPhoneExtension.swift
//  TEstaddScreen
//
//  Created by Чурсина Юлия on 21.07.2020.
//  Copyright © 2020 Julia. All rights reserved.
//

import UIKit
extension AddTestController {
    
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
    func setupAddView() {
        
        iphoneContentView.addSubview(addView)
        addView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            addView.topAnchor.constraint(equalTo:iphoneContentView.topAnchor, constant: 100),
            addView.centerXAnchor.constraint(equalTo: iphoneContentView.centerXAnchor),
            addView.widthAnchor.constraint(equalTo:iphoneContentView.widthAnchor),
            addView.heightAnchor.constraint(equalToConstant: 358)
        ])
    }
    
    
    func setupEmptyView() {
        
        let emptyView = UIView()
        
        iphoneContentView.addSubview(emptyView)
        emptyView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            emptyView.centerXAnchor.constraint(equalTo: iphoneContentView.centerXAnchor),
            emptyView.topAnchor.constraint(equalTo: addView.bottomAnchor, constant: 25),
            emptyView.widthAnchor.constraint(equalTo: iphoneContentView.widthAnchor),
            emptyView.bottomAnchor.constraint(equalTo: iphoneContentView.bottomAnchor),
            emptyView.heightAnchor.constraint(equalToConstant: view.frame.height / 3)
        ])
    }
    
    func setupIphoneViews() {
        
        setupScroll()
        setupAddView()
        setupEmptyView()
    }
}
