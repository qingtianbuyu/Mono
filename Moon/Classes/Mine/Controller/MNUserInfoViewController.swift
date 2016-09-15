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
    
    let leftButton = UIBarButtonItem.buttonWithText("关闭", color: UIColor.lightGray,
                                                     target: self,
                                                     action: #selector(MNUserInfoViewController.leftClick))
    self.navigationItem.leftBarButtonItem = leftButton
    
    let rightButton = UIBarButtonItem.buttonWithText("保存", color: commonCyRanColor,
                                                     target: self,
                                                     action: #selector(MNUserInfoViewController.saveClick))
    
    self.navigationItem.rightBarButtonItem = rightButton
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    let headerView = MNUserInfoHeaderView.viewFromXib() as! MNUserInfoHeaderView
    headerView.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: headerView.calcHeight())
    self.tableView.tableHeaderView = headerView
    self.tableView.sectionHeaderHeight = 10
  }
  
  
  func leftClick() -> Void {
    self.navigationController?.dismiss(animated: true, completion: nil)
  }
  
  func saveClick() -> Void {
    print("------save-----")
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if (indexPath as NSIndexPath).row == 1 {
      let vc = MNHoroscopeViewController()
      self.navigationController?.pushViewController(vc, animated: true)
    }
  }
  
  
}
