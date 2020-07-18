//
//  ViewController.swift
//  TestMaker
//
//  Created by Mac on 13.07.2020.
//  Copyright © 2020 Apples. All rights reserved.
//

import UIKit

class ViewController: UITabBarController {
    
    var addTest = AddTestController()
    var searchTests = SearchTestsController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.addChild(self.vc)
        //self.vc.modalPresentationStyle = .fullScreen
        //self.view.addSubview(self.vc.view)
        
        searchTests.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        searchTests.setupViews(const: Constants(tabBarHeight: self.tabBar.frame.height))
        
        addTest.tabBarItem = UITabBarItem(tabBarSystemItem: .mostViewed, tag: 1)
        
        let tabBarList = [searchTests, addTest]

        viewControllers = tabBarList
    }


}


class Constants {
    let topSafeAreaHeight: CGFloat
    let bottomSafeAreaHeight: CGFloat
    let screenHeight: CGFloat
    let tabBarHeight: CGFloat
    
    init(tabBarHeight: CGFloat = 0.0) {
        if #available(iOS 11.0, *) {
            let window = UIApplication.shared.windows[0]
            let safeFrame = window.safeAreaLayoutGuide.layoutFrame
            self.topSafeAreaHeight = safeFrame.minY
            self.bottomSafeAreaHeight = window.frame.maxY - safeFrame.maxY
        } else {
            self.topSafeAreaHeight = 20.0
            self.bottomSafeAreaHeight = 0.0
        }
        self.tabBarHeight = tabBarHeight
        self.screenHeight = UIScreen.main.bounds.height
    }
}
