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
    self.edgesForExtendedLayout = UIRectEdge()
    self.view.backgroundColor = commonBgColor
  }
  
  override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      self.navigationController?.navigationBar.barStyle = UIBarStyle.default
    
    
//      self.navigationController?.navigationBar.hidden = true
      let titleView = MNSearchTitleView.viewFromXib() as! MNSearchTitleView
      self.view.addSubview(titleView)
  }
  
  
  func initData() {
    categoryEntityList.loadCategory()
  }
  
  
}
