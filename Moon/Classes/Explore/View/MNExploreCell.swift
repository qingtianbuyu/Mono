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
  
  
  @IBOutlet weak var lineView: UIView!
  
  
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
  
  lazy var meowTypeThreeView: MNMeowTypeThreeView = {
    let imageView = MNMeowTypeThreeView.viewFromXib() as! MNMeowTypeThreeView
    self.contentView.insertSubview(imageView, atIndex: 0)
    return imageView
  }()
  
  lazy var meowTypeSevenView: MNMeowTypeSeven = {
    let meowTypeSevenView = MNMeowTypeSeven.viewFromXib() as! MNMeowTypeSeven
    self.contentView.insertSubview(meowTypeSevenView, atIndex: 0)
    return meowTypeSevenView
  }()
  
  lazy var meowTypeEightView: MNMeowTypeEightView = {
    let meowTypeEightView = MNMeowTypeEightView.viewFromXib() as! MNMeowTypeEightView
    self.contentView.insertSubview(meowTypeEightView, atIndex: 0)
    return meowTypeEightView
  }()
  
  lazy var meowTypeNineView: MNMeowTypeNineView = {
    let typeNineView = MNMeowTypeNineView.viewFromXib() as! MNMeowTypeNineView
    self.contentView.insertSubview(typeNineView, atIndex: 0)
    return typeNineView
  }()
  
  var explore: MNExploreEntity? {
    didSet{
      let meow           = explore?.meow
      self.nameLabel.text     = meow?.group?.name
      self.categoryLabel.text = "# " + (meow?.category?.name ?? "")
      self.logoView.m_setImageWithUrl((meow?.group?.logo_url)!, placeHolderName: "icon-place-holder.png")
      
      hiddleAllViews()
      if meow?.meow_type == 2 {
        self.thumbView.hidden = false
        self.thumbView.frame = meow?.thumbF ?? CGRectZero
        self.thumbView.meow  = meow
        
        self.nameLabel.textColor = UIColor.blackColor()
        self.categoryLabel.textColor  = UIColor.blackColor()
        self.lineView.backgroundColor = UIColor.clearColor()
        
      } else if meow?.meow_type == 3 {
        self.meowTypeThreeView.hidden = false
        self.meowTypeThreeView.frame = meow?.meowTypeThreeF ?? CGRectZero
        self.meowTypeThreeView.meow  =  meow
        
        self.nameLabel.textColor = UIColor.blackColor()
        self.categoryLabel.textColor  = UIColor.blackColor()
        self.lineView.backgroundColor = UIColor.clearColor()
      }
      else if meow?.meow_type == 4 {
        self.meowTypeFourView.hidden = false
        self.meowTypeFourView.frame = meow?.meowTypeFourF ?? CGRectZero
        self.meowTypeFourView.meow  = meow
        
        
        self.nameLabel.textColor = UIColor.whiteColor()
        self.categoryLabel.textColor  = UIColor.whiteColor()
        self.lineView.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.2)
        
      } else if meow?.meow_type == 7 {
        self.meowTypeSevenView.hidden = false
          self.meowTypeSevenView.frame = meow?.meowTypeSevenF ?? CGRectZero
        self.meowTypeSevenView.meow  = meow
        
        self.nameLabel.textColor = UIColor.whiteColor()
        self.categoryLabel.textColor  = UIColor.whiteColor()
        
      } else if meow?.meow_type == 8 {
        self.meowTypeEightView.hidden = false
        self.meowTypeEightView.frame = meow?.meowTypeEightF ?? CGRectZero
        self.meowTypeEightView.meow  = meow
        
        self.nameLabel.textColor = UIColor.whiteColor()
        self.categoryLabel.textColor  = UIColor.whiteColor()
        self.lineView.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.2)
      } else if meow?.meow_type == 9 {
        self.meowTypeNineView.hidden = false
        self.meowTypeNineView.frame = meow?.meowTypeNineF ?? CGRectZero
        self.meowTypeNineView.meow  = meow
        
        self.nameLabel.textColor = UIColor.whiteColor()
        self.categoryLabel.textColor  = UIColor.whiteColor()
        self.lineView.backgroundColor = UIColor.whiteColor()
      }
    }
  }
  
  override func awakeFromNib() {
    self.selectionStyle = UITableViewCellSelectionStyle.None
  }
  
  func hiddleAllViews() -> Void {
    self.thumbView.hidden = true
    self.meowTypeThreeView.hidden = true
    self.meowTypeFourView.hidden = true
    self.meowTypeSevenView.hidden = true
    self.meowTypeEightView.hidden = true
    self.meowTypeNineView.hidden = true
  }
  
}