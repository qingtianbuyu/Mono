//
//  MNTrendBannerEntity.swift
//  Moon
//
//  Created by YKing on 16/6/16.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNTrendBannerEntity: NSObject {

  var name: String?
  var start: Int = 0
  var type: String?
  var id: Int = 0
  var is_last_page: Bool = false
  var entity_list: [MNMeow]?
  
  init(dict: [String : AnyObject]) {
    super.init()
    setValuesForKeysWithDictionary(dict)
  }
  
  override func setValue(value: AnyObject?, forKey key: String) {
    if key == "entity_list" {
      let meowDictArray = value as! NSArray
      var meowArray = [MNMeow]()
      for meowDict in meowDictArray {
        let meowObject = meowDict as! [String: AnyObject]
        meowArray.append(MNMeow(dict:meowObject))
      }
      entity_list = meowArray
      return
    }
    super.setValue(value, forKey: key)
  }
  
  
}
