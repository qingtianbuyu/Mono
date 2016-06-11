//
//  MNDiscoverCell.swift
//  Moon
//
//  Created by YKing on 16/6/11.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNDiscoverCell: UITableViewCell {
  
  lazy var squareView: MNDiscoverSquareView = {
    let sqView = MNDiscoverSquareView.viewFromXib() as! MNDiscoverSquareView
    self.contentView.addSubview(sqView)
    return sqView
  }()
  
  
  
  var mod: MNModEntity? {
    didSet {
      if mod?.type == "mashup_square" {
        self.squareView.hidden = false
        self.squareView.frame = CGRectMake(0, 0, self.width, 405)
        self.squareView.mod = mod
      }
    }
  }
  
    override func awakeFromNib() {
        super.awakeFromNib()
      self.backgroundColor = commonBgColor
    }

    
}
