//
//  MNThumbView.swift
//  Moon
//
//  Created by YKing on 16/5/28.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNThumbView: UIImageView {
  
  @IBOutlet weak var meowTextLabel: UILabel!
  @IBOutlet weak var meowAuthorLabel: UILabel!
  
  
  var  meow: MNMeow?{
    didSet{
        self.meowTextLabel?.text = meow?.text
        guard  let author =  meow?.author  else {
          self.meowAuthorLabel?.hidden = true
          return
        }
        self.meowAuthorLabel?.hidden = false
        self.meowAuthorLabel?.text = "-- " + author
      m_setImageWithUrl(meow?.thumb?.raw, placeHolderName: "icon-place-holder.png")
    }
  }

}
