//
//  NSBundle+Extension.swift
//  Moon
//
//  Created by YKing on 16/6/18.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

extension NSBundle {
  
  class func loadPlist(let name: String?) -> String? {
    
    guard let plistName = name else {
      fatalError("can not find plist")
    }
    
    if plistName.hasSuffix("plist") {
      return self.mainBundle().pathForResource(name, ofType: nil)
    }
    
    return self.mainBundle().pathForResource(name, ofType: "plist")
  }

}

