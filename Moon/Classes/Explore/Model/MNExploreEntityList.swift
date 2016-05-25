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
  
  func loadExploreEntityList(start:String) {
      let path = NSBundle.mainBundle().pathForResource("tea.plist", ofType: nil)
    let teaDict =  NSDictionary.init(contentsOfFile: path!) as! [String: AnyObject]
    let tea =  teaDict["tea"] as! [String: AnyObject]
    let teaArray  =  MNTea(dict: tea)
    
    for  dict in teaArray.entity_list! {
      print(dict)
    }
  
  }
  
  
  
  
  
}
