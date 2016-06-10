//
//  MNToolButton.swift
//  Moon
//
//  Created by YKing on 16/6/10.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNToolButton: UIButton {

  override func layoutSubviews() {
    super.layoutSubviews()
    let paddingW: CGFloat = 20
    let paddingH: CGFloat = 23
    let imageWidth:CGFloat = self.width - 2 * paddingW
    let imageH:CGFloat = self.height - 2 * paddingH    
    self.imageView?.frame = CGRectMake(paddingW, paddingH, imageWidth, imageH)
  }

}
