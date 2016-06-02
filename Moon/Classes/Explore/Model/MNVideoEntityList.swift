//
//  MNVideoEntityList.swift
//  Moon
//
//  Created by YKing on 16/6/2.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNVideoEntityList: NSObject {
  var start: Int = 0
  var meows: [MNMeow]?
  
  func loadVideoData() {
    let path = NSBundle.mainBundle().pathForResource("explorer-video.plist", ofType: nil)
    let   videoEntityDict =  NSDictionary(contentsOfFile: path!) as! [String: AnyObject]
    let  videoDictArray =   videoEntityDict["meows"] as! NSArray
    var videoArray = [MNMeow]()
    for videoDict in  videoDictArray {
      let tmp = videoDict as! [String: AnyObject]
      videoArray.append(MNMeow(dict: tmp))
    }
      self.meows = videoArray
    print(videoArray)
  }
  
  
}
