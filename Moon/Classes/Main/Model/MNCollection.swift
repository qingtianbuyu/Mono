//
//  MNCollection.swift
//  Moon
//
//  Created by YKing on 16/6/4.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNCollection: NSObject {
  
  var thumb: MNThumb?
  var banner_img_url: String?
  var title: String?
  var id: Int = 0
  var is_program: Bool = false
  var content_num: Int = 0
  var logo_url: String?
  var type: String?
  var fav_num: Int = 0
  var banner_img_url_thumb: MNThumb?
  var logo_url_thumb: MNThumb?
  
  init(dict: [String: AnyObject]) {
    super.init()
    setValuesForKeysWithDictionary(dict)
  }
  
  override func setValue(value: AnyObject?, forKey key: String) {
    if key == "thumb" {
      thumb = MNThumb(dict: value as! [String: AnyObject])
      return
    }
    
    if key == "logo_url_thumb" {
      logo_url_thumb = MNThumb(dict: value as! [String: AnyObject])
      return
    }
    
    if key == "banner_img_url_thumb" {
      banner_img_url_thumb = MNThumb(dict: value as! [String: AnyObject])
      return
    }
    
    super.setValue(value, forKey: key)
  }
  
}
