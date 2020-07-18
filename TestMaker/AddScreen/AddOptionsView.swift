//
//  AddOptionsView.swift
//  TestMaker
//
//  Created by Чурсина Юлия on 16.07.2020.
//  Copyright © 2020 Julia. All rights reserved.
//

import UIKit

class AddOptionsView: BackgroundBlureView {
    
    lazy var optionOneLable = UILabel()
    lazy var optionTwoLabel = UILabel()
    lazy var optionThreeLabel = UILabel()
    lazy var optionFourLabel = UILabel()
    
    lazy var optionOneTextField = UITextField()
    lazy var optionTwoTextField = UITextField()
    lazy var optionthreeTextField = UITextField()
    lazy var optionFourTextField = UITextField()
    
    lazy var pastButton = UIButton(type: .system)
    lazy var futureButton = UIButton(type: .system)
    
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
        
        setupOptionOneLable()
        setupOptionOneTextField()
        setupOptionTwoLabel()
        setupOptionTwoTextField()
        setupOptionThreeLabel()
        setupOptionThreeTextField()
        setupOptionFourLabel()
        setupOptionFourTextField()
        setupPastButton()
        setupFutureButton()
        
    }
    
    private func setupOptionOneLable() {
        
        optionOneLable.translatesAutoresizingMaskIntoConstraints = false
        
        addNewView(optionOneLable)
        
        optionOneLable.text = "Вариант 1:"
        optionOneLable.font = .systemFont(ofSize: 20)
        
        NSLayoutConstraint.activate([
            optionOneLable.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            optionOneLable.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            optionOneLable.topAnchor.constraint(equalTo: self.topAnchor, constant: 8)
        ])
    }
    
    private func setupOptionOneTextField() {
        
        optionOneTextField.translatesAutoresizingMaskIntoConstraints = false
        
        
        addNewView(optionOneTextField)
        
        optionOneTextField.placeholder = "Введите ответ"
        optionOneTextField.font = .systemFont(ofSize: 20)
        optionOneTextField.textColor = .gray
        
        NSLayoutConstraint.activate([
            optionOneTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            optionOneTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            optionOneTextField.topAnchor.constraint(equalTo: optionOneLable.bottomAnchor, constant: 8)
        ])
    }
    
    private func setupOptionTwoLabel() {
        
        optionTwoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        addNewView(optionTwoLabel)
        
        optionTwoLabel.text = "Вариант 2:"
        optionTwoLabel.font = .systemFont(ofSize: 20)
        
        NSLayoutConstraint.activate([
            optionTwoLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            optionTwoLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            optionTwoLabel.topAnchor.constraint(equalTo:optionOneTextField.bottomAnchor, constant: 8)
        ])
    }
    
    
    private func setupOptionTwoTextField() {
        
        optionTwoTextField.translatesAutoresizingMaskIntoConstraints = false
        
        
        addNewView(optionTwoTextField)
        
        optionTwoTextField.placeholder = "Введите ответ"
        optionTwoTextField.font = .systemFont(ofSize: 20)
        optionTwoTextField.textColor = .gray
        
        NSLayoutConstraint.activate([
            optionTwoTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            optionTwoTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            optionTwoTextField.topAnchor.constraint(equalTo: optionTwoLabel.bottomAnchor, constant: 8)
        ])
    }
    
    private func setupOptionThreeLabel() {
        
        optionThreeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        addNewView(optionThreeLabel)
        
        optionThreeLabel.text = "Вариант 3:"
        optionThreeLabel.font = .systemFont(ofSize: 20)
        
        NSLayoutConstraint.activate([
            optionThreeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            optionThreeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            optionThreeLabel.topAnchor.constraint(equalTo: optionTwoTextField.bottomAnchor, constant: 8)
        ])
    }
    
    private func setupOptionThreeTextField() {
        
        optionthreeTextField.translatesAutoresizingMaskIntoConstraints = false
        
        
        addNewView(optionthreeTextField)
        
        optionthreeTextField.placeholder = "Введите ответ"
        optionthreeTextField.font = .systemFont(ofSize: 20)
        optionthreeTextField.textColor = .gray
        
        NSLayoutConstraint.activate([
            optionthreeTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            optionthreeTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            optionthreeTextField.topAnchor.constraint(equalTo: optionThreeLabel.bottomAnchor, constant: 8)
        ])
    }
    
    private func setupOptionFourLabel() {
        
        optionFourLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        addNewView(optionFourLabel)
        
        optionFourLabel.text = "Вариант 4:"
        optionFourLabel.font = .systemFont(ofSize: 20)
        
        NSLayoutConstraint.activate([
            optionFourLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            optionFourLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            optionFourLabel.topAnchor.constraint(equalTo:optionthreeTextField.bottomAnchor, constant: 8)
        ])
    }
    
    private func setupOptionFourTextField() {
        
        optionFourTextField.translatesAutoresizingMaskIntoConstraints = false
        
        
        addNewView(optionFourTextField)
        
        optionFourTextField.placeholder = "Введите ответ"
        optionFourTextField.font = .systemFont(ofSize: 20)
        optionFourTextField.textColor = .gray
        
        NSLayoutConstraint.activate([
            optionFourTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            optionFourTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            optionFourTextField.topAnchor.constraint(equalTo: optionFourLabel.bottomAnchor, constant: 8)
        ])
    }
    
    private func setupPastButton() {
        
        pastButton.translatesAutoresizingMaskIntoConstraints = false
        
        addNewView(pastButton)
        
        let image = UIImage(systemName: "arrowshape.turn.up.left")
        pastButton.setImage(image, for: .normal)
        
        NSLayoutConstraint.activate([
            pastButton.widthAnchor.constraint(equalToConstant: 72),
            pastButton.heightAnchor.constraint(equalToConstant: 72),
            pastButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            pastButton.topAnchor.constraint(equalTo: optionFourTextField.bottomAnchor, constant: 8)
        ])
    }
    
    private func setupFutureButton() {
        
        futureButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        addNewView(futureButton)
        
        
        let image = UIImage(systemName: "arrowshape.turn.up.right")
        futureButton.setImage(image, for: .normal)
        
        NSLayoutConstraint.activate([
            futureButton.widthAnchor.constraint(equalToConstant: 72),
            futureButton.heightAnchor.constraint(equalToConstant: 72),
            futureButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            futureButton.topAnchor.constraint(equalTo: optionFourTextField.bottomAnchor, constant: 8)
        ])
    }
}
