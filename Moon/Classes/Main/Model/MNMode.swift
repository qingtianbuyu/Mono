//
//  MNMode.swift
//  Moon
//
//  Created by YKing on 16/6/4.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNMode: NSObject {
  var group: [MNGroup]?
  var collection: [MNCollection]?
  
  init(dict: [String: AnyObject]) {
    super.init()
    setValuesForKeysWithDictionary(dict)
  }
  
  override func setValue(value: AnyObject?, forKey key: String) {
    if key == "group" {
      let tmpGroupDictArray = value!["group"] as! NSArray
      var groupArray = [MNGroup]()
      for tmpGroupDict in tmpGroupDictArray {
        let group = MNGroup(dict: tmpGroupDict as! [String: AnyObject])
        groupArray.append(group)
      }
      group = groupArray
      return
    }
    
    if key == "collection" {
      let tmpCollectionDictArray = value!["collection"] as! NSArray
      var collectionArray = [MNCollection]()
      for tmpCollectionDict in tmpCollectionDictArray {
        let group = MNCollection(dict: tmpCollectionDict as! [String: AnyObject])
        collectionArray.append(group)
      }
      collection = collectionArray
      return
    }
    
    
    super.setValue(value, forKey: key)
  }
  
}
