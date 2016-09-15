//
//  MNFollowFeedEntity.swift
//  Moon
//
//  Created by YKing on 16/6/18.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNFollowFeedEntity: NSObject {

  var start: String?
  var data: [MNFollowFeed]?

  func loadFollowFeed() {
    let path             = Bundle.loadPlist("mine.plist")
    let followEntityDict = NSDictionary(contentsOfFile: path!)
    let dataDictArray    = followEntityDict!["data"] as! NSArray
    var dataArray        = [MNFollowFeed]()
    for dataDict in dataDictArray {
      let feed = MNFollowFeed(dict: (dataDict  as! [String: AnyObject]))
      dataArray.append(feed)
    }
    data                 = dataArray
  }
  
}
