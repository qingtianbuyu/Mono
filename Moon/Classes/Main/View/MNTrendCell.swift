//
//  MNTrendCell.swift
//  Moon
//
//  Created by YKing on 16/6/14.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNTrendCell: UITableViewCell {

  @IBOutlet weak var iconView: UIImageView!
  
  @IBOutlet weak var nameLabel: UILabel!
  
  @IBOutlet weak var descLabel: UILabel!
  
  @IBOutlet weak var vipView: UIImageView!
 
  var group: MNStatusGroup? {
    didSet {
      self.iconView.m_setImageWithUrl(group?.logo_url)
      self.nameLabel.text = group?.name
      self.descLabel.text = group?.desc
    }
  }
  
  override func awakeFromNib() {
        super.awakeFromNib()
      
    }
    
}
