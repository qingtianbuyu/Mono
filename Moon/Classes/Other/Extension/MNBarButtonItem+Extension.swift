//
//  MNBarButtonItem+Extension.swift
//  Moon
//
//  Created by YKing on 16/6/9.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

extension UIBarButtonItem {

  /**
   快速创建barButton 高亮图片
   
   - parameter imageName:         图片
   - parameter heightedImageName: 高亮图片
   - parameter target:
   - parameter action:            
   
   - returns: barButton
   */
   class func buttonWithImage( _ imageName: String, heightedImageName: String,target: AnyObject?, action: Selector) -> UIBarButtonItem {
    let button   = UIButton(type: UIButtonType.custom)
    button.setImage(UIImage(named: imageName), for: UIControlState.normal)
    if heightedImageName.characters.count > 0 {
      button.setImage(UIImage(named: heightedImageName), for: UIControlState.highlighted)
    }

    let size     = button.currentImage!.size
    button.addTarget(target, action: action, for: UIControlEvents.touchUpInside)
    button.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
    return UIBarButtonItem(customView: button)
  }

  /**
   快速创建barButton
   
   - parameter imageName: 图片
   - parameter target:
   - parameter action:
   
   - returns: barButton
   */
  class func buttonWithImage( _ imageName: String, target: AnyObject?, action: Selector) -> UIBarButtonItem {
      return self.buttonWithImage(imageName, heightedImageName: "", target: target, action: action)
  }
  
  
  /**
   快速创建BarButtonItem带有高亮颜色
   
   - parameter title:  文字
   - parameter color:  文字颜色
   - parameter highlightColor: 文字高亮颜色
   - parameter target:
   - parameter action:
   
   - returns: return value description
   */
  class func buttonWithText(_ title: String?, color: UIColor, highlightColor: UIColor, target: AnyObject?, action:Selector) -> UIBarButtonItem {
    let rightButton = UIBarButtonItem()
    rightButton.title = title
    rightButton.target = target
    rightButton.action = action
    rightButton.setTitleTextAttributes([NSForegroundColorAttributeName: color], for: UIControlState.normal)
    rightButton.setTitleTextAttributes([NSForegroundColorAttributeName: highlightColor], for: UIControlState.highlighted)
    return rightButton
  }
  
  /**
   快速创建BarButtonItem
   
   - parameter title:  文字
   - parameter color:  文字颜色
   - parameter target:
   - parameter action:
   
   - returns: BarButtonItem
   */
  class func buttonWithText(_ title: String?, color: UIColor, target: AnyObject?, action:Selector) -> UIBarButtonItem {
    return self.buttonWithText(title, color:color, highlightColor: color, target: target, action: action)
  }

  
}
