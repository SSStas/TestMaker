//
//  TestPassingController.swift
//  TestMaker
//
//  Created by Mac on 21.07.2020.
//  Copyright © 2020 Apples. All rights reserved.
//

import UIKit

class TestPassingController: UIViewController {
    
    lazy var backgroundView = BackgroundBlureView()
    lazy var startView = StartTestView()
    lazy var questionView = UIView()
    lazy var endView = UIView()
    
    var constants: Constants = Constants()
    
    var choosenTest: TestDescription?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setupBackgroundView() {
        
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        backgroundView.setupBackgroundView(isBackground: true, isBlure: true, isVibrancy: false)
        
        self.view.addSubview(backgroundView)
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: self.view.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        
    }
    
    private func setupStartView() {
        
        guard let t = self.choosenTest else { return }
        
        startView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(startView)
        self.startView.cancelFunc = self.closeController
        self.startView.setupWith(title: t.title, description: t.description, author: t.author.name, questionsNum: t.questions?.count ?? 0, games: t.games ?? 0, likes: t.likes)
        
        NSLayoutConstraint.activate([
            startView.topAnchor.constraint(equalTo: self.view.topAnchor),
            startView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            startView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            startView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
    
    func setupStartViews(testContent: TestDescription?) {
        
        self.choosenTest = testContent
        
        self.removeViews()
        
        self.setupBackgroundView()
        self.setupStartView()
    }
    
    func removeViews() {
        self.questionView.removeFromSuperview()
        self.endView.removeFromSuperview()
        self.backgroundView.removeFromSuperview()
        self.startView.removeFromSuperview()
    }
    
    func closeController() {
        
        self.removeViews()
        
        self.dismiss(animated: true, completion: nil)
    }
    
}
