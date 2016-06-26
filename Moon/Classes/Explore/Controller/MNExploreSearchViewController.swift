//
//  MNExploreSearchViewController.swift
//  Moon
//
//  Created by YKing on 16/6/26.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

/// 搜索页面
class MNExploreSearchViewController: UIViewController {

    var categoryEntityList = MNCategoryEntityList()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        initData()
    }
  
  func setupView() {
    
  
  }
  
  func initData() {
    categoryEntityList.loadCategory()
  }
  
}
