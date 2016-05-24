//
//  MNMeow.swift
//  Moon
//
//  Created by YKing on 16/5/23.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNMeow: NSObject {
  
  var bang_count: Int = 0
  var is_folded: Bool = false
  var kind: Int = 0
  var group: MNGroup?
  var desc: String?
  var title: String?
  var meow_status: String?
  var object_type: Int = 0
  var has_video: Bool = false
  var id: Int  = 0
  var comment_count: Int  = 0
  var create_time: Int  = 0
  var user: MNMasterInfo?
  var is_filtered: Int  = 0
  var meow_type: Int  = 0
  var category: MNCategory?
  var intro: String?
  var is_post_by_master: Int = 0
  var thumb: MNThumb?
  
  
  init(dict: [String: AnyObject]) {
    super.init()
    setValuesForKeysWithDictionary(dict)
  }
  
  override func setValue(value: AnyObject?, forKey key: String) {
    if key == "group" {
      group = MNGroup(dict: value as! [String: AnyObject])
      return
    }
    
    if key == "user" {
      user = MNMasterInfo(dict: value as! [String: AnyObject])
      return
    }
    
    if key == "category" {
      category = MNCategory(dict: value as! [String: AnyObject])
      return
    }
    
    if key == "thumb" {
      thumb = MNThumb(dict: value as! [String: AnyObject])
      return
    }
    
    if key == "description" {
      desc =  value as? String
      return
    }
    
    
    super.setValue(value, forKey: key)
  }
  
  
  
}
