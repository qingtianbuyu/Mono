//
//  MNGroupMember.swift
//  Moon
//
//  Created by YKing on 16/6/18.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNGroupMember: NSObject {
  
  var group: MNGroup?
  var user_id: String?
  
  init(dict: [String: AnyObject]) {
    super.init()
    setValuesForKeys(dict)
  }
  
  override func setValue(_ value: Any?, forKey key: String) {
    if key == "group" {
      group = MNGroup(dict: (value as! [String: AnyObject]))
      return
    }
    
    super.setValue(value, forKey: key)
  }
  
  
}
