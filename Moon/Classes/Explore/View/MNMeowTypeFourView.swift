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
  
  @IBOutlet weak var introLabel: UILabel!
  var meow: MNMeow? {
    didSet {
      imageView.m_setImageWithUrl(meow?.thumb?.raw, placeHolderName: "place_holder.png")
      titleLabelView.text = meow?.title
      introLabel.text = meow?.intro
      descriptionView.text = meow?.desc ?? ""
    }
  }
  
  
  
}
