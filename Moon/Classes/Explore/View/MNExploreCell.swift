//
//  MNExploreCell.swift
//  Moon
//
//  Created by YKing on 16/5/23.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNExploreCell: UITableViewCell {
  
  static let identifier = String(describing: MNExploreCell.self)

  @IBOutlet weak var logoView: UIImageView!
  
  @IBOutlet weak var nameLabel: UILabel!
  
  @IBOutlet weak var categoryLabel: UILabel!
  
  @IBOutlet weak var lineView: UIView!
  
  
  @IBOutlet weak var buttonShare: UIButton!
  @IBOutlet weak var buttonLike: UIButton!
  @IBOutlet weak var buttonZan: UIButton!
  @IBOutlet weak var buttonComment: UIButton!
  
  
  lazy  var thumbView: MNThumbView = {
    let  thumbView  = MNThumbView.viewFromXib() as! MNThumbView
    self.contentView.insertSubview(thumbView, at: 0)
    return thumbView
  }()
  
  lazy var meowTypeFourView: MNMeowTypeFourView = {
    let typeFourView = MNMeowTypeFourView.viewFromXib() as! MNMeowTypeFourView
    self.contentView.insertSubview(typeFourView, at: 0)
    return typeFourView
  }()
  
  lazy var meowTypeThreeView: MNMeowTypeThreeView = {
    let imageView = MNMeowTypeThreeView.viewFromXib() as! MNMeowTypeThreeView
    self.contentView.insertSubview(imageView, at: 0)
    return imageView
  }()
  
  lazy var meowTypeSevenView: MNMeowTypeSeven = {
    let meowTypeSevenView = MNMeowTypeSeven.viewFromXib() as! MNMeowTypeSeven
    self.contentView.insertSubview(meowTypeSevenView, at: 0)
    return meowTypeSevenView
  }()
  
  lazy var meowTypeEightView: MNMeowTypeEightView = {
    let meowTypeEightView = MNMeowTypeEightView.viewFromXib() as! MNMeowTypeEightView
    self.contentView.insertSubview(meowTypeEightView, at: 0)
    return meowTypeEightView
  }()
  
  lazy var meowTypeNineView: MNMeowTypeNineView = {
    let typeNineView = MNMeowTypeNineView.viewFromXib() as! MNMeowTypeNineView
    self.contentView.insertSubview(typeNineView, at: 0)
    return typeNineView
  }()
  
  var explore: MNExploreEntity? {
    didSet{
      let meow           = explore?.meow
      self.nameLabel.text     = meow?.group?.name
      self.categoryLabel.text = "# " + (meow?.category?.name ?? "")
      self.logoView.m_setImageWithUrl((meow?.group?.logo_url)!, placeHolderName: "icon-place-holder.png")
      
      setupToolBarButtons()
      
      hiddleAllViews()
      if meow?.meow_type == 2 {
        self.thumbView.isHidden = false
        self.thumbView.frame = meow?.thumbF ?? CGRect.zero
        self.thumbView.meow  = meow
        
        self.nameLabel.textColor = UIColor.black
        self.categoryLabel.textColor  = UIColor.black
        self.lineView.backgroundColor = UIColor.clear
        
      } else if meow?.meow_type == 3 {
        self.meowTypeThreeView.isHidden = false
        self.meowTypeThreeView.frame = meow?.meowTypeThreeF ?? CGRect.zero
        self.meowTypeThreeView.meow  =  meow
        
        self.nameLabel.textColor = UIColor.black
        self.categoryLabel.textColor  = UIColor.black
        self.lineView.backgroundColor = UIColor.clear
      }
      else if meow?.meow_type == 4 {
        self.meowTypeFourView.isHidden = false
        self.meowTypeFourView.frame = meow?.meowTypeFourF ?? CGRect.zero
        self.meowTypeFourView.meow  = meow
        
        
        self.nameLabel.textColor = UIColor.white
        self.categoryLabel.textColor  = UIColor.white
        self.lineView.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        
      } else if meow?.meow_type == 7 {
        self.meowTypeSevenView.isHidden = false
          self.meowTypeSevenView.frame = meow?.meowTypeSevenF ?? CGRect.zero
        self.meowTypeSevenView.meow  = meow
        
        self.nameLabel.textColor = UIColor.white
        self.categoryLabel.textColor  = UIColor.white
        self.lineView.backgroundColor = UIColor.white
      } else if meow?.meow_type == 8 {
        self.meowTypeEightView.isHidden = false
        self.meowTypeEightView.frame = meow?.meowTypeEightF ?? CGRect.zero
        self.meowTypeEightView.meow  = meow
        
        self.nameLabel.textColor = UIColor.white
        self.categoryLabel.textColor  = UIColor.white
        self.lineView.backgroundColor = UIColor.black.withAlphaComponent(0.2)
      } else if meow?.meow_type == 9 {
        self.meowTypeNineView.isHidden = false
        self.meowTypeNineView.frame = meow?.meowTypeNineF ?? CGRect.zero
        self.meowTypeNineView.meow  = meow
        
        self.nameLabel.textColor = UIColor.white
        self.categoryLabel.textColor  = UIColor.white
        self.lineView.backgroundColor = UIColor.white
      }
    }
  }
  
  override func awakeFromNib() {
    self.selectionStyle = UITableViewCellSelectionStyle.none
  }
  
  func hiddleAllViews() -> Void {
    self.thumbView.isHidden = true
    self.meowTypeThreeView.isHidden = true
    self.meowTypeFourView.isHidden = true
    self.meowTypeSevenView.isHidden = true
    self.meowTypeEightView.isHidden = true
    self.meowTypeNineView.isHidden = true
  }
  
  func setupToolBarButtons() -> Void {
    let type = explore?.meow?.meow_type
    let bang_count  = explore?.meow?.bang_count ?? 0
    let comment_count = explore?.meow?.comment_count ?? 0
    if type == 2 || type == 9{
      setupButton(self.buttonShare, imageName: "item-btn-share-white", title: "")
      setupButton(self.buttonLike,  imageName: "item-btn-like-white", title: "")
      setupButton(self.buttonZan,   imageName: "item-btn-thumb-white", title:"\(bang_count)")
      setupButton(self.buttonComment, imageName: "item-btn-comment-white", title:"\(comment_count)")
      self.buttonZan.setTitleColor(UIColor.white, for: UIControlState.normal)
      self.buttonComment.setTitleColor(UIColor.white, for: UIControlState.normal)
      
    } else {
      setupButton(self.buttonShare, imageName: "item-btn-share-black", title:"")
      setupButton(self.buttonLike,  imageName: "item-btn-like-black",  title:"")
      setupButton(self.buttonZan,   imageName: "item-btn-thumb-black", title:"\(bang_count)")
      setupButton(self.buttonComment, imageName: "item-btn-comment-black", title:"\(comment_count)")
      self.buttonZan.setTitleColor(UIColor.gray, for: UIControlState.normal)
      self.buttonComment.setTitleColor(UIColor.gray, for: UIControlState.normal)
      
    }
  }
  
  // #pragma mark --
  func setupButton(_ button: UIButton, imageName: String, title: String) -> Void {
    
    let (image, highLightImage) = UIImage.imageName(imageName)
    button.setImage(image, for: UIControlState.normal)
    button.setImage(highLightImage, for: UIControlState.highlighted)
    if title.characters.count > 0 {
      button.setTitle(title, for: UIControlState.normal)
    }
    
    
  }
  
}
