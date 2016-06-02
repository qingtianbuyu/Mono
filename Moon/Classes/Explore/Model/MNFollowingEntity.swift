//
//  MNFollowingEntity.swift
//  Moon
//
//  Created by YKing on 16/6/1.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNFollowingEntity: MNExploreEntity {
  
  var status: String?
  var user_id: String?
  var moment_id: String?
  var uk: String?
  var bang_num: Int  = 0
  var action: Int  = 0
  var created_at: Int  = 0
  var comment_num: Int = 0
  
  
  override  init(dict: [String : AnyObject]) {
    super.init(dict: dict)
    setValuesForKeysWithDictionary(dict)
  }
  
  override func setValue(value: AnyObject?, forKey key: String) {
    if key == "action_user" {
      return
    }
    super.setValue(value, forKey: key)
  }
  
  
  

}
