//
//  MNTabBarController.swift
//  Moon
//
//  Created by YKing on 16/5/19.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNTabBarController: UITabBarController {
  
  override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setupChildViewControllers()
  }
  
  func setupTabBar() -> Void {
        tabBar.alpha = 0.6
        tabBar.barTintColor = UIColor.blackColor()
  }
  
  
  func setupChildViewControllers() -> Void {
    setupChildViewCoontroller(MNRecommandViewController(), title: "推荐", imageName: "tab-recommend", selectedImageName: "tab-recommend-active")
    setupChildViewCoontroller(MNDiscoverViewController() , title: "发现", imageName: "tab-explore"  , selectedImageName: "tab-explore-active")
    setupChildViewCoontroller(MNTrendsViewContrller()    , title: "动态", imageName: "tab-update"   , selectedImageName: "tab-update-active")
    setupChildViewCoontroller(MNMineViewContrller()      , title: "我的", imageName: "tab-mine"     , selectedImageName: "tab-mine-active")
  }
  
  
  func setupChildViewCoontroller(childVc:UIViewController ,title:String, imageName:String, selectedImageName:String) ->Void {
    let image         = UIImage(named: imageName);
    let selectedImage = UIImage(named: selectedImageName);
    let item = UITabBarItem()
    let padding = CGFloat(6)
    item.imageInsets = UIEdgeInsetsMake(padding,0, -padding ,0);
    
    item.selectedImage = selectedImage
    item.image = image
    childVc.tabBarItem = item
    let nav =   MNNavgationController(rootViewController: childVc)
    addChildViewController(nav)
  }
  
  

}
