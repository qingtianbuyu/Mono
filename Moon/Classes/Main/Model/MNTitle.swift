//
//  MNTitle.swift
//  Moon
//
//  Created by YKing on 16/5/21.
//  Copyright © 2016年 YKing. All rights reserved.
//

import Foundation

class MNTitle: NSObject {
  
  var title:String?
  var enable:Bool = false
  
  class func initWithTitle(_ title:String) -> MNTitle {
      let mntitle = MNTitle()
      mntitle.title = title
      return mntitle
  }
  
}
