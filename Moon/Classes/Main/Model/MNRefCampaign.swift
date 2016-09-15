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
  var thumb: MNThumb?
  var logo_url: String?
  var id: Int = 0
  
  init(dict: [String: AnyObject]) {
    super.init()
    setValuesForKeys(dict)
  }
  
  override func setValue(_ value: Any?, forKey key: String) {
    if key == "group_info" {
      group_info = MNGroup(dict: (value as! [String: AnyObject]))
      return
    }
    
    if key == "logo_url_thumb" {
      logo_url_thumb = MNThumb(dict: (value as! [String: AnyObject]))
      return
    }
    
    if key == "thumb" {
      thumb = MNThumb(dict: (value as! [String: AnyObject]))
      return
    }
    
    if key == "recent_participant_info" {
      let participantDictArray =  value as! NSArray
      var participantArray = [MNMasterInfo]()
      for participantDict in   participantDictArray {
          let recent_participant = MNMasterInfo(dict: (participantDict as! [String: AnyObject]))
        participantArray.append(recent_participant)
      }
      recent_participant_info = participantArray
      return
    }
    
    if key == "description" {
        desc = value as? String
      return
    }
    
    
    super.setValue(value, forKey: key)
  }
  
  
}
