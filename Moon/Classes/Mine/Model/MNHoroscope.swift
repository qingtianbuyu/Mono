//
//  MNHoroscope.swift
//  Moon
//
//  Created by YKing on 16/6/24.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNHoroscope: NSObject {

  var name: String?
  var time: String?
  
  convenience init(name: String, time: String) {
    self.init()
    self.name = name
    self.time = time
  }
  
}
