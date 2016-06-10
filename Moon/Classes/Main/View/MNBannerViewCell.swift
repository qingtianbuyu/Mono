//
//  MNBannerViewCell.swift
//  Moon
//
//  Created by YKing on 16/6/10.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNBannerViewCell: UICollectionViewCell {

  @IBOutlet weak var bannerImageView:
  UIImageView!
  
    override func awakeFromNib() {
        super.awakeFromNib()
    }
  
  var banner: MNBanner? {
    didSet {
      self.bannerImageView.m_setImageWithUrl(banner?.banner_img_url)
    }
  }

}
