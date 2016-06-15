//
//  MNTrendHeaderView.swift
//  Moon
//
//  Created by YKing on 16/6/15.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNTrendHeaderView: UITableViewHeaderFooterView {

  
  @IBOutlet weak var titleLabel: UILabel!
  
  
  var title: String? {
    didSet {
      self.titleLabel.text = title
    }
  }
  
  
  override func awakeFromNib() {
    super.awakeFromNib()
    let backView = UIView()
    backView.backgroundColor = UIColor.greenColor()
    self.backgroundView = backView
  }


}
