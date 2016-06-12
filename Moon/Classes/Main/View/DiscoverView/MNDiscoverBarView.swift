//
//  MNDiscoverBarView.swift
//  Moon
//
//  Created by YKing on 16/6/12.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNDiscoverBarView: UIView {

  @IBOutlet weak var barView: UIImageView!
  
  lazy var centerImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.bounds = CGRectMake(0, 0, 105, 105)
    self.addSubview(imageView)
    return imageView
  }()
  
  var mod: MNModEntity? {
    didSet {
      let mode = mod?.entity_list?.last
      if mode?.collection != nil{
        self.barView.m_setImageWithUrl(mode?.collection?.thumb?.raw)
        self.centerImageView.hidden = false
        self.centerImageView.m_setImageWithUrl(mode?.collection?.logo_url_thumb?.raw)
        
      } else {
        self.barView.m_setImageWithUrl(mode?.meow?.ref_campaign?.thumb?.raw)
        self.centerImageView.hidden = true
      }
    }
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    self.centerImageView.center = self.center
  }

}
