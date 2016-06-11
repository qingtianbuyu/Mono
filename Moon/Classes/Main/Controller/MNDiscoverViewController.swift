//
//  MNDiscoverViewController.swift
//  Moon
//
//  Created by YKing on 16/5/19.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNDiscoverViewController: UITableViewController {
  
  
  var modEntityList = MNModEntityList()
  
  lazy var headerView:MNDiscoverHeaderView = {
    let headerView = MNDiscoverHeaderView.viewFromXib() as! MNDiscoverHeaderView
    headerView.frame = CGRectMake(0, 0, self.view.width, 380)
    return headerView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    initData()
  }
  
  func setupView() {
    self.view.backgroundColor = UIColor.greenColor()
    self.title                                                   = "发现"
    self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor()]
    self.navigationController?.navigationBar.barTintColor        = UIColor.blackColor()
    self.navigationItem.leftBarButtonItem                        = UIBarButtonItem.buttonWithImage("icon-search-white", heightedImageName: "", target: self, action: #selector(MNDiscoverViewController.leftClick))
    self.tableView.separatorStyle                                = UITableViewCellSeparatorStyle.None
    let nib = UINib(nibName: String(MNDiscoverCell), bundle: nil)
    self.tableView.registerNib(nib, forCellReuseIdentifier: MNDiscoverCell.viewIdentify)
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    self.tableView.tableHeaderView                               = headerView
    headerView.top_banner  = modEntityList.top_banner
  }
  
  func initData() {
    modEntityList.loadModData()
  }
  
  func leftClick() {
    
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return modEntityList.mod_list?.count ?? 0
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let  cell = tableView.dequeueReusableCellWithIdentifier(MNDiscoverCell.viewIdentify) as! MNDiscoverCell
    let mod   = modEntityList.mod_list![indexPath.row]
    cell.mod = mod
    return cell
  }
  
  override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    let mod   = modEntityList.mod_list![indexPath.row]
    if mod.type == "mashup_square" {
      return 455
    }
    
    return 100
  }
  
  
}
