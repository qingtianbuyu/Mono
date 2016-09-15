//
//  MNExploreMeow.swift
//  Moon
//
//  Created by YKing on 16/6/10.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNExploreMeow: MNMeow {
  var ref_campaign: MNRefCampaign?
  
  override init(dict: [String : AnyObject]) {
    super.init(dict: dict)
    setValuesForKeys(dict)
  }
  
  
  override func setValue(_ value: Any?, forKey key: String) {
    if key == "ref_campaign" {
      ref_campaign  = MNRefCampaign(dict:(value as! [String: AnyObject]))
      return
    }
    super.setValue(value, forKey: key)
  }
  
  
}
