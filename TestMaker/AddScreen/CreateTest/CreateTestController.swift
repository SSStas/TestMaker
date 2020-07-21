//
//  CreateTestController.swift
//  TEstaddScreen
//
//  Created by Чурсина Юлия on 16.07.2020.
//  Copyright © 2020 Julia. All rights reserved.
//

import UIKit

class CreateTestController: UIViewController {
    
    lazy var backgroundView = BackgroundBlureView()
    lazy var addQuestion = AddQuestionView()
    lazy var addOptions = AddOptionsView()
    
    let iphoneContentView = UIView()
    lazy var iphoneScrollView: UIScrollView = {
        
        let scroll = UIScrollView()
        scroll.backgroundColor = .clear
        return scroll
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackground()
        addTapGestureToHideKeyboard()
        
        backgroundView.backgroundImageView.tintColor = .blue
    }
    
    private func setupBackground() {
        
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.setupBackgroundView(isBackground: true, isBlure: true, isVibrancy: false)
        self.view.addSubview(backgroundView)
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: self.view.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        
        setupIphoneViews()
    }
    
    func addTapGestureToHideKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(view.endEditing))
        view.addGestureRecognizer(tapGesture)
    }
    
    
    
}



