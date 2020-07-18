//
//  CreateTestController.swift
//  TestMaker
//
//  Created by Чурсина Юлия on 16.07.2020.
//  Copyright © 2020 Julia. All rights reserved.
//

import UIKit

class CreateTestController: UIViewController {
    
    lazy var backgroundView = BackgroundBlureView()
    lazy var addGuestionView = AddQuestionView()
    lazy var addOptions = AddOptionsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackground()
    }
    
    private func setupBackground() {
        
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        addOptions.translatesAutoresizingMaskIntoConstraints = false
        
        backgroundView.setupBackgroundView(isBackground: true, isBlure: true, isVibrancy: false)
        
        self.view.addSubview(backgroundView)
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: self.view.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        
        self.view.addSubview(addOptions)
        
        NSLayoutConstraint.activate([
            addOptions.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            addOptions.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addOptions.widthAnchor.constraint(equalTo: view.widthAnchor),
            addOptions.heightAnchor.constraint(equalToConstant: 350)
        ])
    }
}


