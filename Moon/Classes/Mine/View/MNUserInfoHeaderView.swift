//
//  MNUserInfoHeaderView.swift
//  Moon
//
//  Created by YKing on 16/6/22.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNUserInfoHeaderView: UIView {

  @IBOutlet weak var iconView: UIImageView!
  
  @IBOutlet weak var genderView: UISegmentedControl!
  
  @IBOutlet weak var genderContainerView: UIView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    iconView.m_setImageWithUrl("http://mmmono.qiniudn.com/FuwgYPymesuyh2_eGlwqUg_hsykF")

    genderView.setBackgroundImage(UIImage.imageWithColor(UIColor.clearColor(), size: genderView.size), forState: UIControlState.Selected, barMetrics: UIBarMetrics.Default)
    genderView.setBackgroundImage(UIImage.imageWithColor(UIColor(red: 0, green: 0, blue: 0,alpha: 0.1), size: genderView.size), forState: UIControlState.Normal, barMetrics: UIBarMetrics.Default)
    genderView.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.blackColor()], forState: UIControlState.Selected)
    genderView.setTitleTextAttributes([NSForegroundColorAttributeName : commonGrayTextColor], forState: UIControlState.Normal)
    
    genderView.layer.cornerRadius  = 5
    genderView.clipsToBounds       = true
    genderView.layer.borderColor   = commonLineTextColor.CGColor
    genderView.layer.borderWidth   = 1

  }
  
  func calcHeight() -> CGFloat {
    return CGRectGetMaxY(self.genderContainerView.frame) + 10
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    iconView.clipsToBounds = true
    iconView.layer.cornerRadius = iconView.width * 0.5
  }
  
  
}
