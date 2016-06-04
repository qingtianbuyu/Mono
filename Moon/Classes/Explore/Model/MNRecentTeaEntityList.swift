//
//  MNRecentTeaEntityList.swift
//  Moon
//
//  Created by YKing on 16/6/4.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNRecentTeaEntityList {
  var start: Int = 0
  var recent_tea: [MNRecentTeaEntity]?
  
  
  /**
   *加载往期茶
   */
  func loadRecentTeaData() -> Void {
    let path                = NSBundle.mainBundle().pathForResource("explore-recenttea.plist", ofType: nil)
    let recentTeaDict       = NSDictionary(contentsOfFile: path!) as! [String: AnyObject]
    let  recentTeaDictArray = recentTeaDict["recent_tea"] as! NSArray
    
    var recentTeaArray = [MNRecentTeaEntity]()
    for recentTea in recentTeaDictArray {
      let  recentTeaTmp = recentTea as! [String: AnyObject]
      recentTeaArray.append(MNRecentTeaEntity(dict:recentTeaTmp))
    }
    recent_tea = recentTeaArray
  }
  
  
  

}
