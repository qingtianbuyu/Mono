//
//  MNTrendFooterView.swift
//  Moon
//
//  Created by YKing on 16/6/16.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNTrendFooterView: UITableViewHeaderFooterView {

  lazy var bannerView: MNTrendBannerView = {
    let bannerView = MNTrendBannerView.viewFromXib() as! MNTrendBannerView
    self.contentView.addSubview(bannerView)
    return bannerView
  }()
  
  var banner: MNTrendBannerEntity? {
    didSet {
      self.bannerView.meows = banner?.entity_list
    }
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    self.bannerView.frame = self.bounds
  }
  

}
