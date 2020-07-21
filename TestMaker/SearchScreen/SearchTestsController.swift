//
//  SearchTestsController.swift
//  TestMaker
//
//  Created by Mac on 16.07.2020.
//  Copyright © 2020 Apples. All rights reserved.
//

import UIKit

class SearchTestsController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    lazy var backgroundView = BackgroundBlureView()
    lazy var searchTextField = SearchTextField()
    lazy var testsTableView = UITableView()
    
    var constants: Constants?
    var tests: TestsParameters = TestsParameters()
    var api: TestsAPI = TestsAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        // setNeedsStatusBarAppearanceUpdate() - обновляет данную переменую
        return .lightContent
    }
    
    func setupViews(const: Constants) {
        
        self.constants = const
        
        // Add background view
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.setupBackgroundView(isBackground: true, isBlure: true, isVibrancy: false)
        
        self.view.addSubview(backgroundView)
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: self.view.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        
        // Add Search view
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(searchTextField)
        self.searchTextField.searchFunc = self.queryChanged
        self.searchTextField.blockFunc = self.blockTableCellsTap
        
        let topSafeAreaHeight = self.constants!.topSafeAreaHeight
        self.searchTextField.topConstraint.constant = topSafeAreaHeight
        NSLayoutConstraint.activate([
            searchTextField.topAnchor.constraint(equalTo: self.view.topAnchor),
            searchTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            searchTextField.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            searchTextField.heightAnchor.constraint(equalToConstant: 120 + topSafeAreaHeight)
        ])
        
        self.setupTableView()
    }
    
    private func setupTableView() {
        testsTableView.translatesAutoresizingMaskIntoConstraints = false
        testsTableView.showsVerticalScrollIndicator = true
        
        self.view.addSubview(testsTableView)
        
        testsTableView.dataSource = self
        testsTableView.register(UINib(nibName: "TestsTableViewCell", bundle: nil), forCellReuseIdentifier: "TestsTableViewCell")
        testsTableView.tableFooterView = UIView()
        testsTableView.rowHeight = 120
        testsTableView.delegate = self
        
        NSLayoutConstraint.activate([
            testsTableView.topAnchor.constraint(equalTo: self.searchTextField.bottomAnchor),
            testsTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -self.constants!.tabBarHeight),
            testsTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            testsTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        
        self.refresh()
    }
    
    func refresh() {
        api.getTestsDescriptions(query: self.tests.query) { [weak self] t in
            self?.tests.searchedTests = t 
            self?.testsTableView.reloadData()
        }
    }
    
    func queryChanged(query: String) {
        self.tests.query = query
        refresh()
    }
    
    func blockTableCellsTap(_ isBlocking: Bool) {
        testsTableView.allowsSelection = isBlocking
    }
    
}

extension SearchTestsController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tests.searchedTests.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TestsTableViewCell", for: indexPath) as? TestsTableViewCell else {
            return TestsTableViewCell()
        }
        cell.setupWith(title: tests.searchedTests[indexPath.row].title, author: tests.searchedTests[indexPath.row].author.name, questionsNum: 0, games: tests.getTestNumParam(indexPath.row, true), likes: tests.getTestNumParam(indexPath.row, false))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Title: \(tests.searchedTests[indexPath.row].title)")
    }
    
    
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
