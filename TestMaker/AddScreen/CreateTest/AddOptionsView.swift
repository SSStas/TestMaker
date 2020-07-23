//
//  addOptionsView.swift
//  TEstaddScreen
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
    lazy var oneButton = UIButton(type: .system)
    lazy var twoButton = UIButton(type: .system)
    lazy var threeButton = UIButton(type: .system)
    lazy var fourButton = UIButton(type: .system)
    
    var leadingConstraint: CGFloat = 15.0
    
    var checkButtons: [UIButton] = []
    weak var delegate: AddOptionsViewDelegate?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupButtons()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupViews()
        setupButtons()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.masksToBounds = true
        self.layer.cornerRadius = self.bounds.width / 7
    }
    
    private func setupButtons() {
        
        checkButtons = [oneButton, twoButton, threeButton, fourButton]
        for i in 0 ..< checkButtons.count {
            checkButtons[i].tag = i
            checkButtons[i].addTarget(self, action: #selector(checkButtonTap), for: .touchUpInside)
        }
    }
    
    @objc func checkButtonTap(sender: UIButton) {
        
        for button in checkButtons {
            var image = UIImage()
            if sender.tag == button.tag {
                image = UIImage(systemName: "checkmark")!
            } else {
                image = UIImage(systemName: "xmark")!
            }
            button.setImage(image, for: .normal)
        }
        
    }
    
    private func setupViews() {
        setupBackgroundView(isBackground: false, isBlure: true, isVibrancy: true)
        
        setupOneButton()
        setupTwoButton()
        setupThreeButton()
        setupFourButton()
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
    
    func showEmptyScreen() {
        
        optionOneTextField.text = ""
        optionTwoTextField.text = ""
        optionthreeTextField.text = ""
        optionFourTextField.text = ""
    }
    
    func showData(question: Question) {
        
        optionOneTextField.text = question.answers[0]
        optionTwoTextField.text = question.answers[1]
        optionthreeTextField.text = question.answers[2]
        optionFourTextField.text = question.answers[3]
    }
    
    private func setupOptionOneLable() {
        
        optionOneLable.translatesAutoresizingMaskIntoConstraints = false
        
        addNewView(optionOneLable)
        
        optionOneLable.text = "Вариант 1:"
        optionOneLable.font = .systemFont(ofSize: 20)
        
        NSLayoutConstraint.activate([
            optionOneLable.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            optionOneLable.leadingAnchor.constraint(equalTo: oneButton.trailingAnchor, constant: leadingConstraint),
            optionOneLable.topAnchor.constraint(equalTo: self.topAnchor, constant: 30)
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
            optionOneTextField.leadingAnchor.constraint(equalTo: oneButton.trailingAnchor, constant: leadingConstraint),
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
            optionTwoLabel.leadingAnchor.constraint(equalTo: twoButton.trailingAnchor, constant: leadingConstraint),
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
            optionTwoTextField.leadingAnchor.constraint(equalTo: twoButton.trailingAnchor, constant: leadingConstraint),
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
            optionThreeLabel.leadingAnchor.constraint(equalTo: threeButton.trailingAnchor, constant: leadingConstraint),
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
            optionthreeTextField.leadingAnchor.constraint(equalTo: threeButton.trailingAnchor, constant: leadingConstraint),
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
            optionFourLabel.leadingAnchor.constraint(equalTo: fourButton.trailingAnchor, constant: leadingConstraint),
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
            optionFourTextField.leadingAnchor.constraint(equalTo: fourButton.trailingAnchor, constant: leadingConstraint),
            optionFourTextField.topAnchor.constraint(equalTo: optionFourLabel.bottomAnchor, constant: 8)
        ])
    }
    
    private func setupPastButton() {
        
        pastButton.translatesAutoresizingMaskIntoConstraints = false
        
        addNewView(pastButton)
        
        let image = UIImage(systemName: "arrowshape.turn.up.left")
        pastButton.setImage(image, for: .normal)
        
        pastButton.addTarget(self, action: #selector(tapBackButton), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            pastButton.widthAnchor.constraint(equalToConstant: 72),
            pastButton.heightAnchor.constraint(equalToConstant: 72),
            pastButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingConstraint),
            pastButton.topAnchor.constraint(equalTo: optionFourTextField.bottomAnchor, constant: 8)
        ])
    }
    
    private func setupFutureButton() {
        
        futureButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        addNewView(futureButton)
        
        
        let image = UIImage(systemName: "arrowshape.turn.up.right")
        futureButton.setImage(image, for: .normal)
        
        futureButton.addTarget(self, action: #selector(tapNextButton), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            futureButton.widthAnchor.constraint(equalToConstant: 72),
            futureButton.heightAnchor.constraint(equalToConstant: 72),
            futureButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            futureButton.topAnchor.constraint(equalTo: optionFourTextField.bottomAnchor, constant: 8)
        ])
    }
    
    @objc private func tapBackButton() {
        delegate?.backButton()
    }
    
    @objc private func tapNextButton() {
        delegate?.nextButton()
    }
    
    private func setupOneButton() {
        
        oneButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        addNewView(oneButton)
        
        let imageOne = UIImage(systemName: "checkmark")
        oneButton.setImage(imageOne, for: .normal)
        
        NSLayoutConstraint.activate([
            oneButton.widthAnchor.constraint(equalToConstant: 50),
            oneButton.heightAnchor.constraint(equalToConstant: 50),
            
            oneButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingConstraint),
            oneButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 30)
        ])
    }
    
    private func setupTwoButton() {
        
        twoButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        addNewView(twoButton)
        
        
        let imageTwo = UIImage(systemName: "xmark")
        twoButton.setImage(imageTwo, for: .normal)
        
        NSLayoutConstraint.activate([
            twoButton.widthAnchor.constraint(equalToConstant: 50),
            twoButton.heightAnchor.constraint(equalToConstant: 50),
            
            twoButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingConstraint),
            twoButton.topAnchor.constraint(equalTo:oneButton.bottomAnchor, constant: 16)
        ])
    }
    
    private func setupThreeButton() {
        
        threeButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        addNewView(threeButton)
        
        
        let imageThree = UIImage(systemName: "xmark")
        threeButton.setImage(imageThree, for: .normal)
        
        NSLayoutConstraint.activate([
            threeButton.widthAnchor.constraint(equalToConstant: 50),
            threeButton.heightAnchor.constraint(equalToConstant: 50),
            
            threeButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingConstraint),
            threeButton.topAnchor.constraint(equalTo: twoButton.bottomAnchor, constant: 16)
            
        ])
    }
    
    private func setupFourButton() {
        
        fourButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        addNewView(fourButton)
        
        
        let imageFour = UIImage(systemName: "xmark")
        fourButton.setImage(imageFour, for: .normal)
        
        NSLayoutConstraint.activate([
            fourButton.widthAnchor.constraint(equalToConstant: 50),
            fourButton.heightAnchor.constraint(equalToConstant: 50),
            
            fourButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: leadingConstraint),
            fourButton.topAnchor.constraint(equalTo:threeButton.bottomAnchor, constant: 16)
        ])
    }
}

protocol AddOptionsViewDelegate: class {
    
    func nextButton()
    func backButton()
}
