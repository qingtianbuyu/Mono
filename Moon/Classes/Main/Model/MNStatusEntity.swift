//
//  MNStatusEntity.swift
//  Moon
//
//  Created by YKing on 16/6/15.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNStatusEntity: NSObject {

  var banner: MNTrendBannerEntity?
  var fav_group_list: [MNStatusGroup]?
  var group_list: [MNStatusGroup]?
  
  func loadStatus() {
    let path       = NSBundle.mainBundle().pathForResource("status.plist", ofType: nil)
    let statusDict = NSDictionary(contentsOfFile: path!)
    let groupListDictArray = statusDict!["group_list"] as! NSArray
    var tmpgroupArray = [MNStatusGroup]()
    for groupDict in groupListDictArray {
      let group = groupDict as! [String: AnyObject]
      tmpgroupArray.append(MNStatusGroup(dict: group))
    }
    group_list = tmpgroupArray
    
    let bannerDict  =  statusDict!["banner"] as! [String: AnyObject]
    banner = MNTrendBannerEntity(dict: bannerDict)
  }
  
  
  
  
}
