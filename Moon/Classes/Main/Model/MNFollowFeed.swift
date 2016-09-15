//
//  MNFollowFeed.swift
//  Moon
//
//  Created by YKing on 16/6/18.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNFollowFeed: NSObject {
  
  var status: String?
  var user_id: String?
  var comment_num: Int = 0
  var created_at: Int = 0
  var moment_id: String?
  var action_user: MNMasterInfo?
  var uk: String?
  var action: Int = 0
  var bang_num: Int = 0
  var group_member: MNGroupMember?
  var meow: MNMeow?
  
  init(dict: [String: AnyObject]) {
    super.init()
    setValuesForKeys(dict)
  }
  
  override func setValue(_ value: Any?, forKey key: String) {
    if key == "action_user" {
      action_user = MNMasterInfo(dict: (value as! [String: AnyObject]))
      return
    }
    
    if key == "group_member" {
      group_member = MNGroupMember(dict: (value as! [String: AnyObject]))
      return
    }
    
    if key == "meow" {
      meow = MNMeow(dict: (value as! [String: AnyObject]))
      return
    }
    
    super.setValue(value, forKey: key)
  }
  
  
}
