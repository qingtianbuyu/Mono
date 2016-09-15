//
//  MNFollowFeedCell.swift
//  Moon
//
//  Created by YKing on 16/6/18.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNFollowFeedCell: UITableViewCell {

  @IBOutlet weak var iconView: UIImageView!
  
  @IBOutlet weak var timeLabel: UILabel!
  
  @IBOutlet weak var titleLabel: UILabel!
  
  @IBOutlet weak var buttonThumb: UIButton!
 
  @IBOutlet weak var buttonComment: UIButton!
  
  @IBOutlet weak var topContainerView: UIView!
  
  lazy var musicView:MNMineMusicView = {
    let musicView = MNMineMusicView.viewFromXib() as! MNMineMusicView
    self.musicContainerView.addSubview(musicView)
    musicView.frame = self.musicContainerView.bounds
    return musicView
  }()
  
  /// 直接设置xib的view的frame并不起作用,所以在外面套一层
  lazy var musicContainerView:UIView = {
    let musicView = UIView()
    self.contentView.addSubview(musicView)
    return musicView
  }()
  
  lazy var sevenView:MNMineSevenView = {
    let sevenView = MNMineSevenView()
    self.contentView.addSubview(sevenView)
    return sevenView
  }()
  
  
  var followFeed: MNFollowFeed? {
    didSet {
      musicView.isHidden = true
      sevenView.isHidden = true
      
     let date =  Date(timeIntervalSince1970: Double(followFeed?.created_at ?? 0))
     let formatter = DateFormatter()
      formatter.dateFormat = "yyyy.MM.dd HH:mm"
      let dateStr =  formatter.string(from: date)
      
      let avatar_url =   followFeed?.action_user?.avatar_url
      self.iconView.m_setImageWithUrl(avatar_url)
      self.timeLabel.text = dateStr
      self.titleLabel.text = followFeed?.action_user?.name
      
      let musicViewX:CGFloat = 55
      let musicViewY:CGFloat = 50
      let musicViewWith = ScreenWidth - musicViewX - 10
      
      // music
      if followFeed?.action == 5 {
        musicView.meow = followFeed?.meow
        musicContainerView.frame = CGRect(x: musicViewX, y: musicViewY, width: musicViewWith, height: 87)
        musicView.isHidden = false
      } else if followFeed?.action == 7 {
        sevenView.group_member = followFeed?.group_member
        sevenView.frame = CGRect(x: musicViewX, y: musicViewY, width: musicViewWith, height: 60)
        sevenView.isHidden = false
      }
    }
  }
  
  
}
