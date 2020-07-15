//
//  BackgroundBlureView.swift
//  TestMaker
//
//  Created by Чурсина Юлия on 15.07.2020.
//  Copyright © 2020 Apples. All rights reserved.
//

import UIKit

class BackgroundBlureView: UIView {
    
    private var isBackground = false
    private var isBlure = false
    private var isVibrancy = false
    
    lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
     }()
    
    lazy var blurView: UIVisualEffectView = {
        
        let view = UIVisualEffectView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var vibrancyView: UIVisualEffectView = {
        
        let view = UIVisualEffectView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var effect: UIBlurEffect?
    
    func addVibrancy() {
        
        let vibrancyEffect: UIVibrancyEffect
        
        guard let blureEffect = effect else {
            return
        }
        
        vibrancyEffect = UIVibrancyEffect(blurEffect: blureEffect, style: .secondaryLabel)
        vibrancyView.effect = vibrancyEffect
        
        blurView.contentView.addSubview(vibrancyView)
        
        vibrancyView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        vibrancyView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        vibrancyView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        vibrancyView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    func addBackgroundImage(imageName: String) {
        
        backgroundImageView.image = UIImage(named: imageName)
        
        self.backgroundColor = .systemBackground
        self.backgroundImageView.tintColor = .systemBlue

        self.addSubview(backgroundImageView)
        self.sendSubviewToBack(backgroundImageView)
        backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    func addBlure() {
        
        let blurEffect: UIBlurEffect
        blurEffect = UIBlurEffect(style: .systemChromeMaterial)
        effect = blurEffect

        self.addSubview(blurView)
        blurView.effect = blurEffect
        blurView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        blurView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        blurView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        blurView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    func removeElements() {
        backgroundImageView.removeFromSuperview()
        blurView.removeFromSuperview()
        backgroundColor = .clear
    }
    
    func addNewView(_ newView: UIView) {
        
        var parentBackgroundView: UIView = self
        
        if isBlure {
            
            parentBackgroundView = blurView.contentView
        }
        
        if isVibrancy {
            
            parentBackgroundView = vibrancyView.contentView
        }
        
        newView.translatesAutoresizingMaskIntoConstraints = false
        parentBackgroundView.addSubview(newView)
        
    }
    
    func setupBackgroundView(isBackground: Bool, isBlure: Bool, isVibrancy: Bool) {
        
        self.isBackground = isBackground
        self.isBlure = isBlure
        self.isVibrancy = isVibrancy
           
        addBlure()
        
        if isBackground {
            addBackgroundImage(imageName: "Background")
        }
        
        if isVibrancy {
            addVibrancy()
        }
    }
}
