//
//  MNModEntity.swift
//  Moon
//
//  Created by YKing on 16/6/4.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNModEntity: NSObject {

  var start: Int = 0
  var name: String?
  var id: Int    = 0
  var type: String?
  var entity_list: [MNMode]?
  
  init(dict: [String: AnyObject]) {
    super.init()
    setValuesForKeysWithDictionary(dict)
  }
  
  override func setValue(value: AnyObject?, forKey key: String) {
    if key == "entity_list" {
      guard let array = (value as? [[String : AnyObject]])  else {
        return
      }
      
      var entityTmp_list = [MNMode]()
      for dict in array {
        let mod = MNMode(dict: dict)
        entityTmp_list.append(mod)
      }
      entity_list = entityTmp_list
      return
    }
    
    
    super.setValue(value, forKey: key)
  }
}
