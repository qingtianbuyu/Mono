//
//  MNDiscoverBarView.swift
//  Moon
//
//  Created by YKing on 16/6/12.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}


class MNDiscoverBarView: UIView {

  @IBOutlet weak var barView: UIImageView!
  
  lazy var centerImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.bounds = CGRect(x: 0, y: 0, width: 105, height: 105)
    self.addSubview(imageView)
    return imageView
  }()
  
  var mod: MNModEntity? {
    didSet {
      let mode = mod?.entity_list?.last
      if mode?.collection != nil{
        self.barView.m_setImageWithUrl(mode?.collection?.thumb?.raw)
        let centerUrl = mode?.collection?.logo_url_thumb?.raw
        guard centerUrl?.characters.count > 0  else {
          self.centerImageView.isHidden = true
          self.centerImageView.m_setImageWithUrl(mode?.collection?.logo_url_thumb?.raw)
          return
        }
        
        self.centerImageView.isHidden = false
        self.centerImageView.m_setImageWithUrl(centerUrl)
        
      } else if mode?.campaign != nil {
        self.barView.m_setImageWithUrl(mode?.campaign?.thumb?.raw)
        self.centerImageView.isHidden = true
      }
      else {
        self.barView.m_setImageWithUrl(mode?.meow?.ref_campaign?.thumb?.raw)
        self.centerImageView.isHidden = true
      }
    }
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    self.centerImageView.center = self.center
  }

}
