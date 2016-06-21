//
//  MNUserInfoViewController.swift
//  Moon
//
//  Created by YKing on 16/6/21.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNUserInfoViewController: UITableViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  func setupView() {
    
  }
  
  override func scrollViewDidScroll(scrollView: UIScrollView) {
    // 滑动强制取消输入法
    self.view.endEditing(true)
  }
  
  
}
