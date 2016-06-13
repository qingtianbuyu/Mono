//
//  MNMode.swift
//  Moon
//
//  Created by YKing on 16/6/4.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNMode: MNBanner {
  
  var group: MNGroup?
  var campaign: MNRefCampaign?
  
  override init(dict: [String: AnyObject]) {
    super.init(dict: dict)
    setValuesForKeysWithDictionary(dict)
  }
  
  override func setValue(value: AnyObject?, forKey key: String) {
    if key == "group" {
      group = MNGroup(dict: (value as! [String: AnyObject]))
      return
    }
    
    if key == "campaign" {
      campaign = MNRefCampaign(dict: (value as! [String: AnyObject]))
      return
    }
    
    
    super.setValue(value, forKey: key)
  }
  
}
