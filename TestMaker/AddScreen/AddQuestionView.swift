//
//  AddQuestionView.swift
//  TestMaker
//
//  Created by Чурсина Юлия on 16.07.2020.
//  Copyright © 2020 Julia. All rights reserved.
//

import UIKit

class AddQuestionView: BackgroundBlureView {
    
    lazy var inputGuestionLable = UILabel()
    lazy var inputGuestionTextField = UITextField()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupViews()
    }
    
    private func setupViews() {
        setupBackgroundView(isBackground: false, isBlure: true, isVibrancy: true)
        
        setupInputGuestionLable()
        setupInputGuestionTextField()
    }
    
    private func setupInputGuestionLable() {
        
        inputGuestionLable.translatesAutoresizingMaskIntoConstraints = false
        
        addNewView(inputGuestionLable)
        
        inputGuestionLable.text = "Введите вопрос "
        inputGuestionLable.font = .systemFont(ofSize: 25)
        
        NSLayoutConstraint.activate([
            inputGuestionLable.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            inputGuestionLable.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            inputGuestionLable.topAnchor.constraint(equalTo: self.topAnchor, constant: 8)
        ])
    }
    private func setupInputGuestionTextField() {
        
        inputGuestionTextField.translatesAutoresizingMaskIntoConstraints = false
        
        
        addNewView(inputGuestionTextField)
        
        inputGuestionTextField.placeholder = "Вопрос..."
        inputGuestionTextField.font = .systemFont(ofSize: 20)
        inputGuestionTextField.textColor = .gray
        
        NSLayoutConstraint.activate([
            inputGuestionTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            inputGuestionTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            inputGuestionTextField.topAnchor.constraint(equalTo: inputGuestionLable.bottomAnchor, constant: 8)
        ])
    }
}
