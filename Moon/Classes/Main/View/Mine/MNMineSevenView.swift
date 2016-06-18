//
//  MNMineSevenView.swift
//  Moon
//
//  Created by YKing on 16/6/18.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNMineSevenView: UIView {

  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = UIColor.colorWithRGB(247, green: 247, blue: 247)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  lazy var titleLabel:UILabel = {
    let titleLabel = UILabel()
    self.addSubview(titleLabel)
    return titleLabel
  }()
  

  lazy var iconView: UIImageView = {
    let iconView = UIImageView()
    self.addSubview(iconView)
    return iconView
  }()
  
  var group_member: MNGroupMember? {
    didSet {
      self.titleLabel.text = group_member?.group?.name
      self.iconView.m_setImageWithUrl(group_member?.group?.logo_url)
    }
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    let lp:CGFloat = 10
    let tp:CGFloat = (self.height - 35) * 0.5
    self.iconView.frame = CGRectMake(lp, tp, 35, 35)
    
    let titleLabelX = CGRectGetMaxX(self.iconView.frame) + lp
    let titleLabelY = CGRectGetMinY(self.iconView.frame)
    self.titleLabel.frame = CGRectMake(titleLabelX, titleLabelY, ScreenWidth, 35)
    
  }
  
  
}
