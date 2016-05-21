//
//  MNView+Extension.swift
//  Moon
//
//  Created by YKing on 16/5/19.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

extension UIView {

  var x:CGFloat {
    return frame.origin.x
  }
  
  var y:CGFloat {
    return frame.origin.y
  }
  
  var width:CGFloat {
    return frame.size.width
  }
  
  var height:CGFloat {
    return frame.size.height
  }
  
  var size:CGSize {
    return frame.size
  }
  
  var point:CGPoint {
    return frame.origin
  }

}

