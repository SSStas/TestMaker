//
//  addGuestionView.swift
//  TEstaddScreen
//
//  Created by Чурсина Юлия on 16.07.2020.
//  Copyright © 2020 Julia. All rights reserved.
//

import UIKit

class AddQuestionView: BackgroundBlureView {
    
    lazy var inputGuestionLable = UILabel()
    lazy var inputGuestionTextField = UITextView()
    
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
        
        self.layer.masksToBounds = true
        self.layer.cornerRadius = self.bounds.width / 7
    }
    
    func showEmptyScreen() {
        inputGuestionTextField.text = "Placeholder"
        inputGuestionTextField.textColor = UIColor.lightGray
    }
    
    func showData(question: Question) {
        inputGuestionTextField.text = question.question
    }
    
    
    private func setupViews() {
        setupBackgroundView(isBackground: false, isBlure: true, isVibrancy: true)
        
        inputGuestionTextField.delegate = self
        
        setupInputGuestionLable()
        setupInputGuestionTextField()
    }
    
    private func setupInputGuestionLable() {
        
        inputGuestionLable.translatesAutoresizingMaskIntoConstraints = false
        
        addNewView(inputGuestionLable)
        
        inputGuestionLable.text = "Введите вопрос: "
        inputGuestionLable.font = .systemFont(ofSize: 25)
        
        NSLayoutConstraint.activate([
            inputGuestionLable.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            inputGuestionLable.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            inputGuestionLable.topAnchor.constraint(equalTo: self.topAnchor, constant: 20)
        ])
    }
    
    private func setupInputGuestionTextField() {
        inputGuestionTextField.translatesAutoresizingMaskIntoConstraints = false
        
        addNewView(inputGuestionTextField)
        
        inputGuestionTextField.backgroundColor = .red
        inputGuestionTextField.text = "Вопрос..."
        inputGuestionTextField.font = .systemFont(ofSize: 20)
        inputGuestionTextField.backgroundColor = .clear
        
        NSLayoutConstraint.activate([
            inputGuestionTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            inputGuestionTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            inputGuestionTextField.topAnchor.constraint(equalTo: inputGuestionLable.bottomAnchor, constant: 15),
            inputGuestionTextField.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}

extension AddQuestionView: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Placeholder"
            textView.textColor = UIColor.lightGray
        }
    }
}
