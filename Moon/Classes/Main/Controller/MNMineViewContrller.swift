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
    
    
    let headerView                 = MNMineHeaderView.viewFromXib() as! MNMineHeaderView 
    self.tableView.tableHeaderView = headerView
    
    
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
  
  
  
}
