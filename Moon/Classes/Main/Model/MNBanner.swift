//
//  MNBanner.swift
//  Moon
//
//  Created by YKing on 16/6/4.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNBanner: NSObject {
  var exposure_url: String?
  var begin: String?
  var banner_img_url: String?
  var collection: MNCollection?
  var meow: MNExploreMeow?
  
  
  init(dict: [String: AnyObject]) {
    super.init()
    setValuesForKeysWithDictionary(dict)
  }
  
  override func setValue(value: AnyObject?, forKey key: String) {
    if key == "collection" {
      collection  = MNCollection(dict: value as! [String: AnyObject])
      return
    }
    
    if key == "meow" {
      meow = MNExploreMeow(dict: value as! [String: AnyObject])
      return
    }
    
    super.setValue(value, forKey: key)
  }
  
}
