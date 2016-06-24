//
//  MNHoroscopeCell.swift
//  Moon
//
//  Created by YKing on 16/6/24.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNHoroscopeCell: UITableViewCell {

  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var timeLabel: UILabel!
  
  var horoscope: MNHoroscope? {
    didSet {
        self.nameLabel.text = horoscope?.name
      self.timeLabel.text = horoscope?.time
    }
  }
  
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
}
