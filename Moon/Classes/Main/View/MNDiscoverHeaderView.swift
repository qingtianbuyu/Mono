//
//  MNDiscoverHeaderView.swift
//  Moon
//
//  Created by YKing on 16/6/10.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNDiscoverHeaderView: UIView {
  
  @IBOutlet weak var toolView: UIView!
  
  lazy var toolImages:[String] = {
    var images = [String]()
    images.append("menu-button-video")
    images.append("menu-button-music")
    images.append("menu-button-album")
    images.append("menu-button-pictext")
    images.append("menu-button-daynote")
    return images
  }()
  
  lazy var bannerView: MNBannerView = {
    let bannerView = MNBannerView.viewFromXib() as! MNBannerView
    self.addSubview(bannerView)
    return bannerView
  }()
  
  
  var top_banner: MNBannerEntity? {
    didSet {
      self.bannerView.frame = CGRectMake(0, 0, self.width, 190)
      self.bannerView.banners = top_banner?.entity_list
    }
  }
  
  
  
  
  
  override func awakeFromNib() {
    super.awakeFromNib()
    setupSubView()
  }
  
  func setupSubView() -> Void {
    addToolButtons()
  }
  
  func addToolButtons() {
    for index in 0...4 {
      let imageView = MNToolButton(type: UIButtonType.Custom)
      imageView.setImage(UIImage(named: toolImages[index]), forState: UIControlState.Normal)
      self.toolView.addSubview(imageView)
    }
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    let toolButtonCount = self.toolView.subviews.count
    let buttonY: CGFloat = 0
    let buttonH = self.toolView.height
    let buttonW = self.toolView.width / CGFloat(toolButtonCount)
    for index in 0..<toolButtonCount {
      let toolbutton =   self.toolView.subviews[index]
      let buttonX = CGFloat(index) * buttonW
      toolbutton.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH)
    }
  }

}
