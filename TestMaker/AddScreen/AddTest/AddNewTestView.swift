//
//  View.swift
//  TEstaddScreen
//
//  Created by Чурсина Юлия on 14.07.2020.
//  Copyright © 2020 Julia. All rights reserved.
//

import UIKit

class AddView: BackgroundBlureView {
    
    lazy var testNameLable = UILabel()
    lazy var testSectionLabel = UILabel()
    lazy var testPasswordLabel = UILabel()
    lazy var testPhotoLabel = UILabel()
    
    lazy var testNameTextField = UITextField()
    lazy var testSectionTextField = UITextField()
    lazy var testPasswordLabelTextField = UITextField()
    
    lazy var testPhotoImage = UIImageView()
    
    lazy var nextButton = UIButton(type: .system)
    
    lazy var addTestView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupViews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        testPhotoImage.layer.cornerRadius = 10
    }
    
    private func setupViews() {
        
        setupBackgroundView(isBackground: false, isBlure: true, isVibrancy: true)
        
        setupTestNameLable()
        setupTestNameTextField()
        setupTestSectionLabel()
        setupTestSectionTextField()
        setupTestPasswordLabel()
        setupTestPasswordLabelTextField()
        setupTestPhotoLabel()
        setupTestPhotoImage()
        setupNextButton()
    }
    
    private func setupTestNameLable() {
        
        testNameLable.translatesAutoresizingMaskIntoConstraints = false
        
        addNewView(testNameLable)
        
        testNameLable.text = "Название"
        testNameLable.font = .systemFont(ofSize: 25)
        
        NSLayoutConstraint.activate([
            testNameLable.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            testNameLable.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            testNameLable.topAnchor.constraint(equalTo: self.topAnchor, constant: 8)
        ])
    }
    
    private func setupTestSectionLabel() {
        
        testSectionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        addNewView(testSectionLabel)
        
        testSectionLabel.text = "Раздел"
        testSectionLabel.font = .systemFont(ofSize: 25)
        
        NSLayoutConstraint.activate([
            testSectionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            testSectionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            testSectionLabel.topAnchor.constraint(equalTo: testNameTextField.bottomAnchor, constant: 8)
        ])
    }
    
    private func setupTestPasswordLabel() {
        
        testPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        addNewView(testPasswordLabel)
        
        testPasswordLabel.text = "Код доступа"
        testPasswordLabel.font = .systemFont(ofSize: 25)
        
        NSLayoutConstraint.activate([
            testPasswordLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            testPasswordLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            testPasswordLabel.topAnchor.constraint(equalTo: testSectionTextField.bottomAnchor, constant: 8)
        ])
    }
    
    private func setupTestPhotoLabel() {
        
        testPhotoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addNewView(testPhotoLabel)
        
        testPhotoLabel.text = "Фоновое \nизображение"
        testPhotoLabel.font = .systemFont(ofSize: 20)
        testPhotoLabel.numberOfLines = 2
        
        NSLayoutConstraint.activate([
            testPhotoLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            testPhotoLabel.topAnchor.constraint(equalTo: testPasswordLabelTextField.bottomAnchor, constant: 16)
        ])
    }
    private func setupNextButton() {
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        addNewView(nextButton)
        
        
        nextButton.titleLabel?.font =  .systemFont(ofSize: 25)
        nextButton.setTitle("Продолжить", for: .normal)
        
        NSLayoutConstraint.activate([
            nextButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
           nextButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            nextButton.topAnchor.constraint(equalTo: testPhotoImage.bottomAnchor, constant: 8)
        ])
    }
    
    private func setupTestNameTextField() {
        
        testNameTextField.translatesAutoresizingMaskIntoConstraints = false
        
        
        addNewView(testNameTextField)
        
        testNameTextField.placeholder = "Математика"
        testNameTextField.font = .systemFont(ofSize: 20)
        testNameTextField.textColor = .gray
        
        NSLayoutConstraint.activate([
            testNameTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            testNameTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            testNameTextField.topAnchor.constraint(equalTo: testNameLable.bottomAnchor, constant: 8)
        ])
    }
    
    private func setupTestSectionTextField() {
        
        testSectionTextField.translatesAutoresizingMaskIntoConstraints = false
        
        
        addNewView(testSectionTextField)
        
        testSectionTextField.placeholder = "Учеба"
        testSectionTextField.font = .systemFont(ofSize: 20)
        testSectionTextField.textColor = .gray
        
        NSLayoutConstraint.activate([
            testSectionTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            testSectionTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            testSectionTextField.topAnchor.constraint(equalTo: testSectionLabel.bottomAnchor, constant: 8)
        ])
    }
    private func setupTestPasswordLabelTextField() {
        
        testPasswordLabelTextField.translatesAutoresizingMaskIntoConstraints = false
        
        
        addNewView(testPasswordLabelTextField)
        
        testPasswordLabelTextField.placeholder = "***"
        testPasswordLabelTextField.font = .systemFont(ofSize: 20)
        testPasswordLabelTextField.textColor = .gray
        
        NSLayoutConstraint.activate([
            testPasswordLabelTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            testPasswordLabelTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            testPasswordLabelTextField.topAnchor.constraint(equalTo: testPasswordLabel.bottomAnchor, constant: 8)
        ])
    }
    private func setupTestPhotoImage() {
        
        testPhotoImage.translatesAutoresizingMaskIntoConstraints = false
        
        testPhotoImage.backgroundColor = .red
        
        addNewView(testPhotoImage)
        
        NSLayoutConstraint.activate([
            testPhotoImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            testPhotoImage.topAnchor.constraint(equalTo:  testPasswordLabelTextField.bottomAnchor, constant: 8),
            testPhotoImage.widthAnchor.constraint(equalToConstant: 80),
            testPhotoImage.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
}
