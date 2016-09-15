//
//  MNBackNavgationController.swift
//  Moon
//
//  Created by YKing on 16/6/24.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNBackNavgationController: UINavigationController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    interactivePopGestureRecognizer?.delegate = nil
  }
  
  override func pushViewController(_ viewController: UIViewController, animated: Bool) {
    viewController.navigationItem.hidesBackButton = true
    if childViewControllers.count > 0 {
      viewController.hidesBottomBarWhenPushed = true
      
      let button = UIButton(type:UIButtonType.custom);
      button.setBackgroundImage(UIImage(named: "icon-update-arrow-left-black"), for: UIControlState.normal)
      button.setBackgroundImage(UIImage(named: "icon-update-arrow-left-black"), for: UIControlState.highlighted)
      button.frame = CGRect(x:0, y:0, width:button.currentBackgroundImage!.size.width, height:button.currentBackgroundImage!.size.height)
      button.addTarget(self, action: #selector(MNBackNavgationController.back), for: UIControlEvents.touchUpInside)
      viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
    }
    super.pushViewController(viewController, animated: animated)
  }
  
  
  func back() {
    self.popViewController(animated: true)
  }


}
