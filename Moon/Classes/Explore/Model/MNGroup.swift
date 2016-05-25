//
//  MNGroup.swift
//  Moon
//
//  Created by YKing on 16/5/23.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNGroup: NSObject {
  
  var status: String?
  var category: String?
  var kind: Int = 0
  var topic_content_num: Int = 0
  var slogan: String?
  var desc: String?
  var discuss_content_num: Int = 0
  var admin_list: [String]?
  var thumb: MNThumb?
  var master_info: MNMasterInfo?
  var member_num: Int = 0
  var publisher_type: Int  = 0
  var campaign_num: Int = 0
  var cert_kind_id: Int = 0
  var logo_url: String?
  var id: Int = 0
  var name: String?
  var cert: MNCert?
  
  
  init(dict: [String:AnyObject]) {
    super.init()
    setValuesForKeysWithDictionary(dict)
  }
  
  override func setValue(value: AnyObject?, forKey key: String) {
    if key == "thumb" {
      thumb = MNThumb(dict: value as! [String: AnyObject])
      return
    }
    if key == "master_info" {
      master_info = MNMasterInfo(dict: value as! [String: AnyObject])
      return
    }
    
    
    if key == "description" {
      desc =  value as? String
      return
    }
    if key == "cert" {
      cert =  MNCert(dict: value as! [String: AnyObject])
      return
    }
    
    if key == "admin_data" {
      return
    }
    
    
    super.setValue(value, forKey: key)
  }
  
  
  
}
