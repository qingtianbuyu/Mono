//
//  MNMineMusicView.swift
//  Moon
//
//  Created by YKing on 16/6/18.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNMineMusicView: UIView {

  @IBOutlet weak var imageView: UIImageView!
  
  @IBOutlet weak var centerLabel: UILabel!

  @IBOutlet weak var topLabel: UILabel!
  
  var meow: MNMeow? {
    didSet {
      self.imageView.m_setImageWithUrl(meow?.thumb?.raw)
      self.centerLabel.text = meow?.group?.name
      self.topLabel.text = meow?.title
    }
  }
  
  
}
