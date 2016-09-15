//
//  MNFollwoingEntityList.swift
//  Moon
//
//  Created by YKing on 16/6/1.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNFollwoingEntityList {
  
  var data: [MNFollowingEntity]?
  
  func loadFollowingData() -> Void {
    let path = Bundle.main.path(forResource: "0601-following.plist", ofType: nil)
    let  dict = NSDictionary(contentsOfFile: path!) as! [String : AnyObject]
    let  datas =   dict["data"] as! NSArray
    var tmpFollwoingData = [MNFollowingEntity]()
    for data in datas {
      let dataDict = data as! [String: AnyObject]
      tmpFollwoingData.append(MNFollowingEntity(dict:dataDict ))
    }
    data = tmpFollwoingData
  }
  
}
