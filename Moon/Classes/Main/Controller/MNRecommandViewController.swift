//
//  MNRecommandViewController.swift
//  Moon
//
//  Created by YKing on 16/5/19.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNRecommandViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
   func setupView() {
    view.backgroundColor = UIColor.whiteColor()
    self.edgesForExtendedLayout = UIRectEdge.None
    self.navigationController?.navigationBar.hidden = true
    let titleView = MNNavgationBar(frame: CGRect.zero)
    view.addSubview(titleView)
    self.navigationController?.navigationBar.tintColor = UIColor.blackColor()
  }
  
  
}
