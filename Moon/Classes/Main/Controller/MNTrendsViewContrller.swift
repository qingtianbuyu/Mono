//
//  MNTrendsViewContrller.swift
//  Moon
//
//  Created by YKing on 16/5/19.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNTrendsViewContrller: UITableViewController {
  
  var statusEntity = MNStatusEntity()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.redColor()
    setupNavBar()
    setupTableView()
    initData()
  }
  
  func initData() -> Void {
    statusEntity.loadStatus()
  }
  
  
  func setupNavBar() {
    self.title = "动态"
    self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor()]
    self.navigationController?.navigationBar.barTintColor = UIColor.blackColor()
    self.navigationItem.rightBarButtonItem = UIBarButtonItem.buttonWithImage("icon-plus-white-send-button", heightedImageName: "", target: self, action: #selector(MNTrendsViewContrller.plusClick))
  }
  
  func setupTableView() {
    self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
    let nib = MNTrendCell.nib() as! UINib
    self.tableView.registerNib(nib , forCellReuseIdentifier: MNTrendCell.viewIdentify)
    let headerNib = MNTrendHeaderView.nib() as! UINib
    self.tableView.registerNib(headerNib, forHeaderFooterViewReuseIdentifier: MNTrendHeaderView.viewIdentify)
    
  }
  
  func plusClick() {
  
  }
  
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 2
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    if section == 1 {
      return statusEntity.group_list?.count ?? 0
    }
    return 3
  }
  

  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(MNTrendCell.viewIdentify) as! MNTrendCell
    if indexPath.section == 1 {
        cell.group  = statusEntity.group_list![indexPath.row]
    }
    
      return cell
  }
  
  override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 73
  }
  
  override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 35
  }
  
  override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let  headerView  = tableView.dequeueReusableHeaderFooterViewWithIdentifier(MNTrendHeaderView.viewIdentify) as! MNTrendHeaderView
    if section == 0 {
    headerView.title = "置顶"
    } else {
    headerView.title = "我关注的站"
    }


    return headerView
  }
  
}
