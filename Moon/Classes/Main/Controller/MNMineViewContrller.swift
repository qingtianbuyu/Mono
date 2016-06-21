//
//  MNMeViewContrller.swift
//  Moon
//
//  Created by YKing on 16/5/19.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNMineViewContrller: UITableViewController {
  
  var followFeedEntity = MNFollowFeedEntity()
  var iconViewCenterY: CGFloat  = 0
  
  lazy var iconView: UIImageView? = {
    let iconWH:CGFloat = 192 * 0.5
    let iconF = CGRectMake(15, 32, iconWH, iconWH)
    let iconView = UIImageView(frame:iconF)
    self.navigationController?.view.addSubview(iconView)
    iconView.layer.borderColor = UIColor.whiteColor().CGColor
    iconView.layer.borderWidth = 1
    iconView.clipsToBounds = true
    iconView.layer.cornerRadius = iconView.width * 0.5
    iconView.m_setImageWithUrl("http://mmmono.qiniudn.com/FuwgYPymesuyh2_eGlwqUg_hsykF")
    return iconView
  }()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.purpleColor()
    setupView()
    initData()
  }
  
  func setupView() {
    self.iconViewCenterY = self.iconView?.center.y ?? 0
    setupNav()
    setupTableView()
//    setupIconView()
  }
  
  func setupNav() {
    self.title                                                   = "YKing"
    self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor()]
    self.navigationItem.rightBarButtonItem                       = UIBarButtonItem.buttonWithImage("icon-setting-white", target: self, action: #selector(MNMineViewContrller.settingClick))
    self.navigationController?.navigationBar.barTintColor        = UIColor.blackColor()
  }
  
  func setupTableView(){
    self.tableView.separatorStyle  = UITableViewCellSeparatorStyle.None
    let nib                        = MNFollowFeedCell.nib() as! UINib
    self.tableView.registerNib(nib, forCellReuseIdentifier: MNFollowFeedCell.viewIdentify)
  }
  
  func setupIconView() {
    let iconWH:CGFloat = 192 * 0.5
    let iconF = CGRectMake(15, 32, iconWH, iconWH)
    let iconView = UIImageView(frame:iconF)
    self.navigationController?.view.addSubview(iconView)
    iconView.layer.borderColor = UIColor.whiteColor().CGColor
    iconView.layer.borderWidth = 1
    iconView.clipsToBounds = true
    iconView.layer.cornerRadius = iconView.width * 0.5
    iconView.m_setImageWithUrl("http://mmmono.qiniudn.com/FuwgYPymesuyh2_eGlwqUg_hsykF")
  }
  
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    self.iconView?.hidden = false
    let headerView                 = MNMineHeaderView.viewFromXib() as! MNMineHeaderView
    let headerHeight = headerView.calcHeight()
    headerView.bounds = CGRectMake(0, 0, ScreenWidth, headerHeight)
    self.tableView.tableHeaderView = headerView
    headerView.delegate = self
  }
  
  func initData() {
    followFeedEntity.loadFollowFeed()
  }
  
  /**
   点击设置
   */
  func settingClick() -> Void {
    
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return followFeedEntity.data?.count ?? 0
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(MNFollowFeedCell.viewIdentify) as! MNFollowFeedCell
      cell.followFeed = followFeedEntity.data![indexPath.row]
    return cell
  }
  
  override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    let followFeed = followFeedEntity.data![indexPath.row]
    if followFeed.action == 7 {
      return 160
    } else if followFeed.action == 5 {
      // music
      return 187
    }
    return 0
  }
  
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
  }
  
  override func scrollViewDidScroll(scrollView: UIScrollView) {
    var offsetY = scrollView.contentOffset.y
    
    //缩放相关
    offsetY *= (-1)
    var iconViewBounds = self.iconView?.bounds
    let iconWH:CGFloat = 192 * 0.5
    let minIconWH:CGFloat = 64 * 0.5
    // 随着滚动缩减的头像的尺寸
    let dtR = offsetY * (iconWH * 0.5 - minIconWH * 0.5) / (self.iconViewCenterY - 42)
    let wh = 2 * dtR
    if wh  < 30 || wh > iconWH {
        return
    }
    
    self.iconView!.layer.cornerRadius = wh/2.0;
    iconViewBounds!.size.height = wh;
    iconViewBounds!.size.width  = wh;
    self.iconView!.bounds = iconViewBounds!;
  }
  
  override func viewWillDisappear(animated: Bool) {
    super.viewWillDisappear(animated)
    self.iconView?.hidden = true
  }
  
}

extension MNMineViewContrller: MineHeaderViewDelegate {
  
  func editClick() {
    let st = UIStoryboard(name: String(MNUserInfoViewController), bundle: NSBundle.mainBundle())
    let vc = st.instantiateViewControllerWithIdentifier(String(MNUserInfoViewController))
    self.navigationController?.pushViewController(vc, animated: true)
  }
  func tipClick() {
    
  }
  
  func favoriteClick() {
    
  }
  func messageClick() {
    
  }

  func saySthClick() {
    
  }
}

