//
//  MNRefCampaign.swift
//  Moon
//
//  Created by YKing on 16/6/10.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNRefCampaign: NSObject {

  var status: String?
  var group_info: MNGroup?
  var slogan: String?
  var desc: String?
  var title: String?
  var rules: String?
  var publisher_type: Int = 0
  var create_time: Int = 0
  var participant_num: Int = 0
  var content_num: Int = 0
  var logo_url_thumb: MNThumb?
  var recent_participant_info: [MNMasterInfo]?
  
}
