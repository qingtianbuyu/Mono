//
//  MNTrendBannerViewCell.swift
//  Moon
//
//  Created by YKing on 16/6/16.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNTrendBannerViewCell: UICollectionViewCell {

  @IBOutlet weak var imageView: UIImageView!
  
  var meow: MNMeow? {
    didSet {
        self.imageView.m_setImageWithUrl(meow?.group?.thumb?.raw)
    }
  }
  
    override func awakeFromNib() {
        super.awakeFromNib()   
    }

}
