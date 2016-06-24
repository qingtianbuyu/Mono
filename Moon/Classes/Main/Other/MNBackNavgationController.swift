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
  
  override func pushViewController(viewController: UIViewController, animated: Bool) {
    viewController.navigationItem.hidesBackButton = true
    if childViewControllers.count > 0 {
      viewController.hidesBottomBarWhenPushed = true
      
      let button = UIButton(type:UIButtonType.Custom);
      button.setBackgroundImage(UIImage(named: "icon-update-arrow-left-black"), forState: UIControlState.Normal)
      button.setBackgroundImage(UIImage(named: "icon-update-arrow-left-black"), forState: UIControlState.Highlighted)
      button.frame = CGRectMake(0, 0, button.currentBackgroundImage!.size.width, button.currentBackgroundImage!.size.height)
      button.addTarget(self, action: #selector(MNBackNavgationController.back), forControlEvents: UIControlEvents.TouchUpInside)
      viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
    }
    super.pushViewController(viewController, animated: animated)
  }
  
  
  func back() {
    self.popViewControllerAnimated(true)
  }


}
