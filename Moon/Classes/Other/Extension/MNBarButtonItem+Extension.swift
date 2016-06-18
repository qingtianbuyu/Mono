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

  
}