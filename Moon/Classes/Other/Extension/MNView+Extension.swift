//
//  MNView+Extension.swift
//  Moon
//
//  Created by YKing on 16/5/19.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

extension UIView {

  var x: CGFloat {
    get {
      return frame.origin.x
    }
  }
  
  var y: CGFloat {
    get {
      return frame.origin.y
    }
  }
  
  var width: CGFloat {
    get {
      return frame.size.width
    }
  }
  
  var height: CGFloat {
    get {
      return frame.size.height
    }
  }
  
  var size: CGSize {
    get {
      return frame.size
    }
  }
  
  var point: CGPoint {
    get {
      return frame.origin
    }
  }
  
  class func viewFromXib() -> AnyObject {
    return Bundle.main.loadNibNamed(String(describing: self), owner: nil, options: nil)!.last! as AnyObject
  }
  
  class func nib() -> AnyObject {
    return UINib(nibName: String(describing: self), bundle: nil)
  }
  
  
  class var viewIdentify:String {
    get {
      return String(describing: self)
    }
  }
  

}

