//
//  MNNavgationController.swift
//  Moon
//
//  Created by YKing on 16/5/19.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNNavgationController: UINavigationController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    interactivePopGestureRecognizer?.delegate = nil
  }
  
  override func pushViewController(viewController: UIViewController, animated: Bool) {
    viewController.navigationItem.hidesBackButton = true
    if childViewControllers.count > 0 {
      viewController.hidesBottomBarWhenPushed = true
    }
    super.pushViewController(viewController, animated: animated)
  }
  
  override func preferredStatusBarStyle() -> UIStatusBarStyle {
    return UIStatusBarStyle.LightContent
  }
  
  
}
