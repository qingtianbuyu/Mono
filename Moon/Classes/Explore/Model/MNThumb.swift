//
//  MNThumb.swift
//  Moon
//
//  Created by YKing on 16/5/23.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNThumb: NSObject {
  
  var raw: String?
  var width: Int = 0
  var height: Int = 0
  var format: String?
  var error_code: Int = 0
  
  init(dict: [String: AnyObject]) {
    super.init()
    setValuesForKeys(dict)
  }
  
  
  
}
