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
    headerView.frame = CGRect(x: 0, y: 0, width: self.view.width, height: 380)
    return headerView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    initData()
  }
  
  func setupView() {
    self.view.backgroundColor = UIColor.green
    self.title                                                   = "发现"
    self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
    self.navigationController?.navigationBar.barTintColor        = UIColor.black
    self.navigationItem.leftBarButtonItem                        = UIBarButtonItem.buttonWithImage("icon-search-white", heightedImageName: "", target: self, action: #selector(MNDiscoverViewController.leftClick))
    self.tableView.separatorStyle                                = UITableViewCellSeparatorStyle.none
    let nib = UINib(nibName: String(describing: MNDiscoverCell.self), bundle: nil)
    self.tableView.register(nib, forCellReuseIdentifier: MNDiscoverCell.viewIdentify)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.tableView.tableHeaderView                               = headerView
    headerView.top_banner  = modEntityList.top_banner
  }
  
  func initData() {
    modEntityList.loadModData()
  }
  
  func leftClick() {
    
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return modEntityList.mod_list?.count ?? 0
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let  cell = tableView.dequeueReusableCell(withIdentifier: MNDiscoverCell.viewIdentify) as! MNDiscoverCell
    let mod   = modEntityList.mod_list![(indexPath as NSIndexPath).row]
    cell.mod = mod
    return cell
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
    let mod   = modEntityList.mod_list![(indexPath as NSIndexPath).row]
    if mod.type == "mashup_square" {
      return 455
    } else if mod.type == "mashup_bar" {
      return 187.5
    }
    
    return 100
  }
  
  
}
