//
//  MNNavgationbar.swift
//  Moon
//
//  Created by YKing on 16/5/21.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNNavgationBar: UIView {
  
  override init(frame: CGRect) {
    let navFrame = CGRectMake(0, 0, ScreenBounds.width, 64)
    super.init(frame: navFrame)
    self.backgroundColor = UIColor.blackColor()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
