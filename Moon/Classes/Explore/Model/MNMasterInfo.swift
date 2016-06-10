//
//  MNMasterInfo.swift
//  Moon
//
//  Created by YKing on 16/5/23.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNMasterInfo: NSObject {

  var user_id: String?
  var name: String?
  var is_anonymous: Bool = true
  var horoscope: Int = 0
  var gender: Int = 0
  var self_description: String?
  var avatar_url: String?
  var coordinate: MNCoordinate?
  var avatar_url_thumb: MNThumb?
  
  init(dict: [String: AnyObject]) {
    super.init()
    setValuesForKeysWithDictionary(dict)
  }
  
  override func setValue(value: AnyObject?, forKey key: String) {
    if key == "coordinate" {
      coordinate = MNCoordinate(dict: value as! [String: AnyObject])
      return
    }
    
    if key == "avatar_url_thumb" {
      avatar_url_thumb = MNThumb(dict: value as! [String: AnyObject])
      return
    }
    
    
    super.setValue(value, forKey: key)
  }
  
  
  
}
