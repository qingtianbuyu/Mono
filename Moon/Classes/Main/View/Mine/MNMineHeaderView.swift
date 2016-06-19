//
//  MNMineHeaderView.swift
//  Moon
//
//  Created by YKing on 16/6/18.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNMineHeaderView: UIView {

  
  @IBOutlet weak var iconView: UIImageView!
  
  // 宽度约束
  @IBOutlet weak var contentLabelWidthCons: NSLayoutConstraint!
  
  @IBOutlet weak var contentLabel: UILabel!
  
  @IBOutlet weak var lineView: UIView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    self.iconView.m_setImageWithUrl("http://mmmono.qiniudn.com/FuwgYPymesuyh2_eGlwqUg_hsykF")
    self.contentLabelWidthCons.constant =  ScreenWidth - 30
  }
  
  func calcHeight() -> CGFloat {
    // 数据赋值
    self.contentLabel.text = "暂无数据赋值数据赋值数据赋值数据赋值数据赋值数据赋值数据赋值数据赋值数据赋值数据赋值数据赋值数据赋值数据赋值"
    // 刷新布局
    layoutIfNeeded()
    // 获取高度
    return CGRectGetMaxY(self.lineView.frame)
  }
  
}
