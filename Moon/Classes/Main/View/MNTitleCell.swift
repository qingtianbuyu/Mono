//
//  MNTitleCell.swift
//  Moon
//
//  Created by YKing on 16/5/21.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNTitleCell: UICollectionViewCell {

  
  var titleButton:UIButton?
  
  var title:MNTitle?{
    didSet{
      titleButton?.setTitle(title?.title, forState: UIControlState.Normal)
      titleButton?.enabled = title?.enable ?? false
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupSubViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    titleButton!.frame = self.bounds
  }
  
  func setupSubViews() -> Void {
    titleButton   = UIButton(type: UIButtonType.Custom)
    titleButton?.titleLabel?.font = UIFont.systemFontOfSize(13)
    titleButton!.setTitleColor(UIColor.whiteColor(),forState: UIControlState.Disabled)
    titleButton!.setTitleColor(commonLightColor,  forState: UIControlState.Normal)
    addSubview(titleButton!)
  }
  
  
  
  
  
  
}
