//
//  MNTea.swift
//  Moon
//
//  Created by YKing on 16/5/25.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNTea: NSObject {
  
  var entity_list: [MNExploreEntity]?
  var kind: Int  = 2
  var share_text: String?
  var push_msg: String?
  var title: String?
  var sub_title: String?
  var bg_img_url: String?
  var release_date: NSDate?
  var intro: String?
  var read_time: String?
  var share_time: String?
  var share_image: String?
  var id: Int = 0
  
  init(dict: [String: AnyObject]) {
    super.init()
    setValuesForKeysWithDictionary(dict)
  }
  
  override func setValue(value: AnyObject?, forKey key: String) {
    
    if key ==  "entity_list" {
      guard let array = (value  as?[[String : AnyObject]])  else {
        return
      }
      var tmpArray = [MNExploreEntity]()
      for dict in array {
        tmpArray.append(MNExploreEntity(dict:dict))
      }
      entity_list = tmpArray
      return
    }
    
    super.setValue(value, forKey: key)
  }
  
  
  

}
