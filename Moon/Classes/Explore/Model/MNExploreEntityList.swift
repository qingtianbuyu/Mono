//
//  MNExploreEntityList.swift
//  Moon
//
//  Created by YKing on 16/5/23.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNExploreEntityList {
  
  var start: Int = 1
  var entity_list: [MNExploreEntity]?
  
  func loadExploreEntityList(_ start:String) {
      let path = Bundle.main.path(forResource: "05-30-0853.plist", ofType: nil)
    let teaDict =  NSDictionary(contentsOfFile: path!) as! [String: AnyObject]
//    let tea =  teaDict["tea"] as! [String: AnyObject]
//    let tea =  teaDict["morning_tea"] as! [String: AnyObject]
    let teaArray  =  MNTea(dict: teaDict)
    entity_list = teaArray.entity_list
  }
  
  
  
  
  
}
