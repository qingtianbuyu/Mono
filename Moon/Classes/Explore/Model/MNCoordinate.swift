//
//  MNCoordinate.swift
//  Moon
//
//  Created by YKing on 16/5/23.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNCoordinate: NSObject {

  var latitude: Int = 0
  var area_name: String?
  var longitude: Int = 0
  
  init(dict: [String: AnyObject]) {
    super.init()
    setValuesForKeys(dict)
  }
  
  
}
