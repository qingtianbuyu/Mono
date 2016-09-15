//
//  UIColor+Extension.swift
//  Moon
//
//  Created by YKing on 16/6/18.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

extension UIColor {
  
  class func colorWithRGB(_ red: CGFloat, green: CGFloat, blue:CGFloat) -> UIColor {
    return UIColor(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: 1)
  }

}

