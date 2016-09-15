//
//  MNRecentTeaEntity.swift
//  Moon
//
//  Created by YKing on 16/6/4.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNRecentTeaEntity: NSObject {
  
  var push_msg: String?
  var bg_img_url: String?
  var intro: String?
  var share_image: String?
  var id: Int = 0
  var kind: Int = 0
  var share_text: String?
  var title: String?
  var release_date: String?
  var sub_title: String?
  var read_time: String?
  
  init(dict: [String: AnyObject]) {
    super.init()
    setValuesForKeys(dict)
  }
  
  
  
}
