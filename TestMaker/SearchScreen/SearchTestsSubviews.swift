//
//  SearchScreenSubviews.swift
//  TestMaker
//
//  Created by Mac on 18.07.2020.
//  Copyright © 2020 Apples. All rights reserved.
//

import Foundation
import UIKit


class SearchTextField: UIView {
    
    @IBOutlet var view: UIView!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    var nibName = "SearchView"
    
    override init(frame: CGRect) {
       super.init(frame: frame)
        loadViewFromNib(nibName: self.nibName)
     }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadViewFromNib(nibName: self.nibName)
    }

}

extension UIView {
    
    func loadViewFromNib(nibName: String) {
        let view = UINib(nibName: nibName, bundle: Bundle(for: type(of: self))).instantiate(withOwner: self, options: nil)[0] as! UIView

        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        self.addSubview(view);
    }
}

class TestsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var questionsLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupWith(title: String, author: String, questionsNum: Int) {
        titleLabel.text = title
        authorLabel.text = "By: \(author)"
        questionsLabel.text = "❓: \(questionsNum)"
    }

}
