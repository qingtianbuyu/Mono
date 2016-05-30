//
//  MNMeowTypeSeven.swift
//  Moon
//
//  Created by YKing on 16/5/29.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNMeowTypeSeven: UIView {

  @IBOutlet weak var bgView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var playButton: UIButton!
  @IBOutlet weak var descriptionLabel: UILabel!
  
  var meow: MNMeow? {
    didSet {
      self.bgView.m_setImageWithUrl(meow?.thumb?.raw, placeHolderName:  "place_holder.png")
      self.titleLabel.text = meow?.title
      self.descriptionLabel.text = meow?.desc
    }
  }
  

}
