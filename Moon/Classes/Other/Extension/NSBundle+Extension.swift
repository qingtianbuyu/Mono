//
//  NSBundle+Extension.swift
//  Moon
//
//  Created by YKing on 16/6/18.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

extension Bundle {
  
  class func loadPlist( _ name: String?) -> String? {
    
    guard let plistName = name else {
      fatalError("can not find plist")
    }
    
    if plistName.hasSuffix("plist") {
      return self.main.path(forResource: name, ofType: nil)
    }
    
    return self.main.path(forResource: name, ofType: "plist")
  }

}

