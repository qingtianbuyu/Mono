//
//  MNUserInfoViewController.swift
//  Moon
//
//  Created by YKing on 16/6/21.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNUserInfoViewController: UITableViewController {

  var user: MNMasterInfo?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    
  }
  
  func setupView() {
    self.title = "请先稍微完善个人资料"
    self.view.backgroundColor = commonBgColor
    let leftButton = UIBarButtonItem()
    leftButton.title = "关闭"
    leftButton.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.lightGrayColor()], forState: UIControlState.Normal)
    leftButton.target = self
    leftButton.action = #selector(MNUserInfoViewController.leftClick)
    self.navigationItem.leftBarButtonItem = leftButton
    
    let rightButton = UIBarButtonItem()
    rightButton.title = "保存"
    rightButton.target = self
    rightButton.action = #selector(MNUserInfoViewController.saveClick)
    
    rightButton.setTitleTextAttributes([NSForegroundColorAttributeName: commonCyRanColor], forState: UIControlState.Normal)
    self.navigationItem.rightBarButtonItem = rightButton
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    let headerView = MNUserInfoHeaderView.viewFromXib() as! MNUserInfoHeaderView
    headerView.frame = CGRectMake(0, 0, ScreenWidth, headerView.calcHeight())
    self.tableView.tableHeaderView = headerView
    self.tableView.sectionHeaderHeight = 10
  }
  
  
  func leftClick() -> Void {
    self.navigationController?.dismissViewControllerAnimated(true, completion: nil)
  }
  
  func saveClick() -> Void {
    print("------save-----")
  }
  
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    if indexPath.row == 1 {
      let vc = MNHoroscopeViewController()
      self.navigationController?.pushViewController(vc, animated: true)
    }
  }
  
  
}
