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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.purpleColor()
    setupView()
    initData()
  }
  
  func setupView() {
    setupNav()
    setupTableView()
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
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    let headerView                 = MNMineHeaderView.viewFromXib() as! MNMineHeaderView
    let headerHeight = headerView.calcHeight()
    headerView.bounds = CGRectMake(0, 0, ScreenWidth, headerHeight)
    self.tableView.tableHeaderView = headerView
    //setup iconView
    let iconWH:CGFloat = 150 * 0.5
    let iconF = CGRectMake(15, 0, iconWH, iconWH)
    let iconView = UIImageView(frame:iconF)
    self.tableView.addSubview(iconView)
    iconView.layer.borderColor = UIColor.whiteColor().CGColor
    iconView.clipsToBounds = true
    iconView.layer.cornerRadius = iconView.width * 0.5
    iconView.m_setImageWithUrl("http://mmmono.qiniudn.com/FuwgYPymesuyh2_eGlwqUg_hsykF")

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
    let offsetY = scrollView.contentOffset.y
    let percent = (offsetY + 64) / 75
    print(percent)
    
  }
  
  
  
  
}
