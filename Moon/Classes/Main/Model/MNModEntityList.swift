//
//  MNModEntityList.swift
//  Moon
//
//  Created by YKing on 16/6/4.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNModEntityList {
  var start: String?
  var top_banner: MNBannerEntity?
  var mod_list: [MNModEntity]?

  func loadModData() {
    let path              = NSBundle.mainBundle().pathForResource("new_explore.plist", ofType: nil)
    let modEntityListDict = NSDictionary(contentsOfFile:path!) as! [String: AnyObject]
    let modDictArray      = modEntityListDict["mod_list"] as! NSArray
    let bannerDict        = modEntityListDict["top_banner"] as! [String: AnyObject]
    top_banner            = MNBannerEntity(dict: bannerDict)
    var modTmpArray       = [MNModEntity]()
    for modEntityDict in modDictArray {
    let mod               = (modEntityDict as! [String: AnyObject])
      modTmpArray.append(MNModEntity(dict:mod))
    }
    mod_list              = modTmpArray
  }
  
}
