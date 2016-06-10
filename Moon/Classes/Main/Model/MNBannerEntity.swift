//
//  MNBannerEntity.swift
//  Moon
//
//  Created by YKing on 16/6/4.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNBannerEntity: NSObject {
  var start: Int = 0
  var type: String?
  var id: Int = 0
  var name: String?
  var entity_list: [MNBanner]?
  
  init(dict: [String: AnyObject]) {
    super.init()
    setValuesForKeysWithDictionary(dict)
  }
  
  override func setValue(value: AnyObject?, forKey key: String) {
    
    if key == "entity_list" {
      guard let array = (value  as?[[String : AnyObject]])  else {
        return
      }
      var bannerArray = [MNBanner]()
      for dict in array {
        bannerArray.append(MNBanner(dict:dict))
      }
      entity_list = bannerArray
      return
    }
    
    
    
    super.setValue(value, forKey: key)
  }
  
  
}
