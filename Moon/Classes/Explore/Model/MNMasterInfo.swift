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
}
