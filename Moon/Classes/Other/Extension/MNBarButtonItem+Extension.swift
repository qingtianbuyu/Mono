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
   class func buttonWithImage(let imageName: String,let heightedImageName: String,target: AnyObject?, action: Selector) -> UIBarButtonItem {
    let button   = UIButton(type: UIButtonType.Custom)
    button.setImage(UIImage(named: imageName), forState: UIControlState.Normal)
    if heightedImageName.characters.count > 0 {
      button.setImage(UIImage(named: heightedImageName), forState: UIControlState.Highlighted)
    }

    let size     = button.currentImage!.size
    button.addTarget(target, action: action, forControlEvents: UIControlEvents.TouchUpInside)
    button.frame = CGRectMake(0, 0, size.width, size.height)
    return UIBarButtonItem(customView: button)
  }

  /**
   快速创建barButton
   
   - parameter imageName: 图片
   - parameter target:
   - parameter action:
   
   - returns: barButton
   */
  class func buttonWithImage(let imageName: String, target: AnyObject?, action: Selector) -> UIBarButtonItem {
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
  class func buttonWithText(title: String?, color: UIColor, highlightColor: UIColor, target: AnyObject?, action:Selector) -> UIBarButtonItem {
    let rightButton = UIBarButtonItem()
    rightButton.title = title
    rightButton.target = target
    rightButton.action = action
    rightButton.setTitleTextAttributes([NSForegroundColorAttributeName: color], forState: UIControlState.Normal)
    rightButton.setTitleTextAttributes([NSForegroundColorAttributeName: highlightColor], forState: UIControlState.Highlighted)
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
  class func buttonWithText(title: String?, color: UIColor, target: AnyObject?, action:Selector) -> UIBarButtonItem {
    return self.buttonWithText(title, color:color, highlightColor: color, target: target, action: action)
  }

  
}