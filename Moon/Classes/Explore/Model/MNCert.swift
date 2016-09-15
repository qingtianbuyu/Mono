//
//  MNCert.swift
//  Moon
//
//  Created by YKing on 16/5/25.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNCert: NSObject {
  
  var cert_url_type: Int = 0
  var app_name: String?
  var weibo_url: String?
  var home_page: String?
  var ios_download_url: String?
  var cert_kind_id: Int = 0
  var ios_stats_download_url: String?
  var wechat_id: String?
  var id: Int = 0
  var android_download_url: String?
  
  init(dict: [String: AnyObject]) {
    super.init()
    setValuesForKeys(dict)
  }
  
  
}
