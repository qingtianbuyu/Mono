//
//  MNExploreEntity.swift
//  Moon
//
//  Created by YKing on 16/5/23.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNExploreEntity: NSObject {

  var meow: MNMeow?
  
  init(dict: [String: AnyObject]) {
    super.init()
    setValuesForKeysWithDictionary(dict)
  }
  
  override func setValue(value: AnyObject?, forKey key: String) {
    if key == "meow" {
      meow = MNMeow(dict:value as! [String: AnyObject])
      return
    }
    
    super.setValue(value, forKey: key)
  }
  
  
  
}
