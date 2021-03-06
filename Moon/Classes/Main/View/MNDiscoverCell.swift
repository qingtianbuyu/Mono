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
  
  
  lazy var barView: MNDiscoverBarView = {
    let baView = MNDiscoverBarView.viewFromXib() as! MNDiscoverBarView
    self.contentView.addSubview(baView)
    return baView
  }()
  
  var mod: MNModEntity? {
    didSet {
      self.squareView.isHidden = true
      self.barView.isHidden = true
      
      if mod?.type == "mashup_square" {
        self.squareView.mod = mod
        self.squareView.isHidden = false
      } else if mod?.type == "mashup_bar" {
        self.barView.mod = mod
        self.barView.isHidden = false
      }
    }
  }
  
    override func awakeFromNib() {
        super.awakeFromNib()
      self.backgroundColor = commonBgColor
    }

  
  override func layoutSubviews() {
    super.layoutSubviews()
    self.barView.frame = self.bounds
    self.squareView.frame = CGRect(x: 0, y: 0, width: self.width, height: 455)
  }
    
}
