//
//  AddScreen.swift
//  TEstaddScreen
//
//  Created by Чурсина Юлия on 14.07.2020.
//  Copyright © 2020 Julia. All rights reserved.
//

import UIKit

class AddTestController: UIViewController {
    
    lazy var backgroundView = BackgroundBlureView()
    lazy var addView = AddView()
    
    let iphoneContentView = UIView()
    lazy var iphoneScrollView: UIScrollView = {
        
        let scroll = UIScrollView()
        scroll.backgroundColor = .clear
        return scroll
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBackground()
        setupIphoneViews()
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
        
    }
}
