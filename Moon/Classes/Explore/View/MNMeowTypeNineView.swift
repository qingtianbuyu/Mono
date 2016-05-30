//
//  MNMeowTypeNineView.swift
//  Moon
//
//  Created by YKing on 16/5/28.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNMeowTypeNineView: UIImageView {

  @IBOutlet weak var titleLabelView: UILabel!
  
  var meow: MNMeow? {
    didSet {
      m_setImageWithUrl(meow?.images![0].raw, placeHolderName: "place_holder.png")
      titleLabelView.text = meow?.title
    }
  }
  
}
