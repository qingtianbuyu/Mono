//
//  MNExploreCell.swift
//  Moon
//
//  Created by YKing on 16/5/23.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNExploreCell: UITableViewCell {

  @IBOutlet weak var logoView: UIImageView!
  
  @IBOutlet weak var nameLabel: UILabel!
  
  @IBOutlet weak var categoryLabel: UILabel!
  
  lazy  var thumbView: MNThumbView = {
    let  thumbView  = MNThumbView.viewFromXib() as! MNThumbView
    self.contentView.insertSubview(thumbView, atIndex: 0)
    return thumbView
  }()
  
  lazy var meowTypeFourView: MNMeowTypeFourView = {
    let typeFourView = MNMeowTypeFourView.viewFromXib() as! MNMeowTypeFourView
    self.contentView.insertSubview(typeFourView, atIndex: 0)
    return typeFourView
  }()
  
  lazy var meowTypeThreeView: UIImageView = {
    let imageView = UIImageView()
    self.contentView.insertSubview(imageView, atIndex: 0)
    return imageView
  }()
  
  
  
  var explore: MNExploreEntity? {
    didSet{
      let meow           = explore?.meow
      self.nameLabel.text     = meow?.group?.name
      self.categoryLabel.text = "# " + (meow?.category?.name ?? "")
      self.logoView.m_setImageWithUrl((meow?.group?.logo_url)!, placeHolderName: "icon-place-holder.png")
      if meow?.meow_type == 2 {
        self.thumbView.hidden = false
        self.thumbView.frame = meow?.thumbF ?? CGRectZero
        self.thumbView.meow  = meow
        
        self.meowTypeFourView.hidden = true
        self.meowTypeThreeView.hidden = true
      } else if meow?.meow_type == 3 {
        self.meowTypeThreeView.hidden = false
        self.meowTypeThreeView.frame = meow?.meowTypeThreeF ?? CGRectZero
        self.meowTypeThreeView.m_setImageWithUrl((meow?.pics![0].raw)!, placeHolderName: "icon-place-holder.png")
        
        self.meowTypeFourView.hidden = true
        self.thumbView.hidden = true
      }
      else if meow?.meow_type == 4 {
        
        self.meowTypeFourView.hidden = false
        self.meowTypeFourView.frame = meow?.meowTypeFourF ?? CGRectZero
        self.meowTypeFourView.meow  = meow
        
        self.meowTypeThreeView.hidden = true
        self.thumbView.hidden = true
      } else {
        self.thumbView.hidden = true
        self.meowTypeFourView.hidden = true
        self.meowTypeThreeView.hidden = true
      }
    }
  }
  
  override func awakeFromNib() {
  
    
  }
  
  
  
}
