//
//  TestPassingSubviews.swift
//  TestMaker
//
//  Created by Mac on 22.07.2020.
//  Copyright © 2020 Apples. All rights reserved.
//

import Foundation
import UIKit

typealias CancelationProcess = () -> Void

class StartTestView: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var likesButton: UIButton!
    @IBOutlet weak var gamesLabel: UILabel!
    @IBOutlet weak var questionsLabel: UILabel!
    
    let nibName = "StartTestView"
    
    var cancelFunc: CancelationProcess?
    
    override init(frame: CGRect) {
       super.init(frame: frame)
        loadViewFromNib(nibName: self.nibName)
     }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadViewFromNib(nibName: self.nibName)
    }
    
    @IBAction func backButtonTap(_ sender: Any) {
        if let f = self.cancelFunc {
            f()
        }
    }
    
    func setupWith(title: String, description: String, author: String, questionsNum: Int, games: Int, likes: Int) {
        titleLabel.text = title
        authorLabel.text = "Автор: \(author)"
        descriptionTextView.text = "Описание:\n\(description)"
        questionsLabel.text = "❓: \(questionsNum)"
        gamesLabel.text = "🎮: \(games)"
        likesButton.setTitle("👍: \(likes)", for: .normal)
    }
    
}
