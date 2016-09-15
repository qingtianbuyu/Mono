//
//  AppDelegate.swift
//  Moon
//
//  Created by YKing on 16/5/16.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
      setupKeyWindow();
    return true
  }
  
  func setupKeyWindow() {
    window = UIWindow(frame:ScreenBounds);
    window?.makeKeyAndVisible()
    window?.rootViewController = MNTabBarController()
  }

}

