//
//  MNTeaCell.swift
//  Moon
//
//  Created by YKing on 16/6/4.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNTeaCell: UICollectionViewCell {

  @IBOutlet weak var teaImageView: UIImageView!
  
  @IBOutlet weak var timeLabel: UILabel!
  
  @IBOutlet weak var datelabel: UILabel!
  
  @IBOutlet weak var tealabel: UILabel!
  
  var tea: MNRecentTeaEntity? {
    didSet {
      if tea?.kind == 0 {
        self.teaImageView.image = UIImage(named: "icon-morning-tea-unread")
        self.tealabel.text = "早茶"
      } else if tea?.kind == 2 {
        self.teaImageView.image = UIImage(named: "icon-afternoon-tea-unread")
        self.tealabel.text = "下午茶"
      }
    
    }
  }
  
  override func awakeFromNib() {
    self.backgroundColor = UIColor.white
  }
  
  
}
