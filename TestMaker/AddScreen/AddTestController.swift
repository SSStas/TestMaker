//
//  AddTestController.swift
//  TestMaker
//
//  Created by Чурсина Юлия on 15.07.2020.
//  Copyright © 2020 Apples. All rights reserved.
//

import UIKit

class AddTestController: UIViewController {
    
    lazy var backgroundView = BackgroundBlureView()
    lazy var addView = AddView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackground()
    }
    
    private func setupBackground() {
        
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        addView.translatesAutoresizingMaskIntoConstraints = false
        
        backgroundView.setupBackgroundView(isBackground: true, isBlure: true, isVibrancy: false)
        
        self.view.addSubview(backgroundView)
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: self.view.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        
        self.view.addSubview(addView)
        
        NSLayoutConstraint.activate([
            addView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
            addView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addView.widthAnchor.constraint(equalTo: view.widthAnchor),
            addView.heightAnchor.constraint(equalToConstant: 350)
        ])
    }
}

