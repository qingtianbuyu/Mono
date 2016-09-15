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
    mod_list       = [MNModEntity]()
    loadWithPlist("new-explore1.plist")
    loadWithPlist("new-explore2.plist")
    loadWithPlist("new-explore3.plist")
    loadWithPlist("new-explore4.plist")
    loadWithPlist("new-explore5.plist")
    
  }
  
  func loadWithPlist(_ path: String) {
    var modArray = [MNModEntity]()
    let path              = Bundle.main.path(forResource: path, ofType: nil)
    let modEntityListDict = NSDictionary(contentsOfFile:path!) as! [String: AnyObject]
    let modDictArray      = modEntityListDict["mod_list"] as! NSArray
    
    for modEntityDict in modDictArray {
      let mod               = (modEntityDict as! [String: AnyObject])
      modArray.append(MNModEntity(dict:mod))
    }
    mod_list?.append(contentsOf: modArray)
    guard   let bannerDict  = (modEntityListDict["top_banner"] as? [String: AnyObject]) else {
      return
    }
      top_banner            = MNBannerEntity(dict: bannerDict)
  }
  
  
  
}
