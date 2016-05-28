//
//  MNMeowTypeFourView.swift
//  Moon
//
//  Created by YKing on 16/5/28.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNMeowTypeFourView: UIView {

  
  @IBOutlet weak var imageView: UIImageView!
  
  @IBOutlet weak var titleLabelView: UILabel!
  
  @IBOutlet weak var descriptionView: UILabel!
  
  var meow: MNMeow? {
    didSet {
      imageView.m_setImageWithUrl(meow?.thumb?.raw, placeHolderName: "icon-place-holder.png")
      titleLabelView.text = meow?.title
      descriptionView.text = meow?.desc
    }
  }
  
  
  
}
