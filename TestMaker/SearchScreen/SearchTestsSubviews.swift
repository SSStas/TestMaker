//
//  SearchScreenSubviews.swift
//  TestMaker
//
//  Created by Mac on 18.07.2020.
//  Copyright © 2020 Apples. All rights reserved.
//

import Foundation
import UIKit

typealias ProcessingRequest = (_ query: String) -> Void
typealias BlockingTableView = (_ isBlocking: Bool) -> Void

class SearchTextField: UIView {
    
    @IBOutlet var view: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    let nibName = "SearchView"
    
    var searchFunc: ProcessingRequest?
    var blockFunc: BlockingTableView?
    
    override init(frame: CGRect) {
       super.init(frame: frame)
        loadViewFromNib(nibName: self.nibName)
        searchBar.delegate = self
        self.searchBar.showsCancelButton = false
     }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadViewFromNib(nibName: self.nibName)
        searchBar.delegate = self
        self.searchBar.showsCancelButton = false
    }
    
    @IBAction func parametersOnClick(_ sender: Any) {
        
    }
    
}

extension SearchTextField: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.searchBar.setShowsCancelButton(true, animated: true)
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        self.searchBar.setShowsCancelButton(false, animated: true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.view.endEditing(true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let f = self.searchFunc {
            f(searchBar.text ?? "")
        }
        self.view.endEditing(true)
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
    @IBOutlet weak var gamesLabel: UILabel!
    @IBOutlet weak var likesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupWith(title: String, author: String, questionsNum: Int, games: String, likes: String) {
        titleLabel.text = title
        authorLabel.text = "От: \(author)"
        questionsLabel.text = "❓: \(questionsNum)"
        gamesLabel.text = "🎮: " + games
        likesLabel.text = "👍: " + likes
    }
    
}
