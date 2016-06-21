//
//  MNMineHeaderView.swift
//  Moon
//
//  Created by YKing on 16/6/18.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

protocol MineHeaderViewDelegate {
  
  func editClick()
  func favoriteClick()
  func messageClick()
  func tipClick()
  func saySthClick()
  
}


class MNMineHeaderView: UIView {
  //点击事件代理
  var delegate: MineHeaderViewDelegate?
  
  @IBOutlet weak var iconView: UIImageView!
  
  // 宽度约束
  @IBOutlet weak var contentLabelWidthCons: NSLayoutConstraint!
  
  @IBOutlet weak var contentLabel: UILabel!
  
  @IBOutlet weak var lineView: UIView!
  
  @IBAction func editClick(sender: AnyObject) {
    delegate?.editClick()
  }
  
  @IBAction func saySthClick(sender: AnyObject) {
    delegate?.saySthClick()
  }
  
  @IBAction func tipClick(sender: AnyObject) {
    delegate?.tipClick()
  }
  
  @IBAction func messageClick(sender: AnyObject) {
    delegate?.messageClick()
  }
  
  @IBAction func favClick(sender: AnyObject) {
    delegate?.favoriteClick()
  }
  
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
