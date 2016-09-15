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
    view.backgroundColor = UIColor.red
    setupNavBar()
    setupTableView()
    initData()
  }
  
  func initData() -> Void {
    statusEntity.loadStatus()
  }
  
  
  func setupNavBar() {
    self.title = "动态"
    self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
    self.navigationController?.navigationBar.barTintColor = UIColor.black
    self.navigationItem.rightBarButtonItem = UIBarButtonItem.buttonWithImage("icon-plus-white-send-button", heightedImageName: "", target: self, action: #selector(MNTrendsViewContrller.plusClick))
  }
  
  func setupTableView() {
    let mtableView  = UITableView(frame: self.tableView.frame, style: UITableViewStyle.grouped)
    self.tableView = mtableView
    self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
    let nib = MNTrendCell.nib() as! UINib
    self.tableView.register(nib , forCellReuseIdentifier: MNTrendCell.viewIdentify)
    let headerNib = MNTrendHeaderView.nib() as! UINib
    self.tableView.register(headerNib, forHeaderFooterViewReuseIdentifier: MNTrendHeaderView.viewIdentify)
    self.tableView.register(MNTrendFooterView.self, forHeaderFooterViewReuseIdentifier: MNTrendFooterView.viewIdentify)
    
    let headerF = CGRect(x: 0, y: 0, width: self.view.width, height: 45)
    let headerView = UIView(frame: headerF)
    let searchF = headerView.bounds
    let searchView = UISearchBar(frame: searchF)
    searchView.text = "搜索造物主、主题站、小组和活动"
    headerView.addSubview(searchView)
    self.tableView.tableHeaderView = headerView
  }
  
  func plusClick() {
  
  }
  
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    return 2
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    if section == 1 {
      return statusEntity.group_list?.count ?? 0
    }
    return statusEntity.group_list?.count ?? 0
  }
  
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: MNTrendCell.viewIdentify) as! MNTrendCell
//    if indexPath.section == 1 {
        cell.group  = statusEntity.group_list![indexPath.row]
//    }
      return cell
  }
  
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 73
  }
  
  override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 35
  }
  
  override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let  headerView  = tableView.dequeueReusableHeaderFooterView(withIdentifier: MNTrendHeaderView.viewIdentify) as! MNTrendHeaderView
    if section == 0 {
    headerView.title = "置顶"
    } else {
    headerView.title = "我关注的站"
    }
    return headerView
  }
  
  override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    if section == 0 {
      return 190
    }
    return 0.1
  }
  
  override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    if section == 1 {
      return nil
    }
     let  footer =  tableView.dequeueReusableHeaderFooterView(withIdentifier: MNTrendFooterView.viewIdentify) as! MNTrendFooterView
      footer.banner =  statusEntity.banner
    return footer
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
  override func scrollViewDidScroll(_ scrollView: UIScrollView) {
    self.view.endEditing(true)
  }
  
  
}
