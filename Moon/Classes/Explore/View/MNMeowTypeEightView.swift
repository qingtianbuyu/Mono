//
//  MNMeowTypeEightView.swift
//  Moon
//
//  Created by YKing on 16/5/29.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNMeowTypeEightView: UIView {

  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var titleLabelView: UILabel!
  @IBOutlet weak var descriptiomLabel: UILabel!
  
  var meow: MNMeow? {
    didSet {
      imageView.m_setImageWithUrl(meow?.thumb?.raw, placeHolderName:  "icon-place-holder.png")
      titleLabelView.text = meow?.title
      descriptiomLabel.text = meow?.desc
    }
  }

}
