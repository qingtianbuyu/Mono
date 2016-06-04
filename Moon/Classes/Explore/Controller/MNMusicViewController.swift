//
//  MNMusicViewController.swift
//  Moon
//
//  Created by YKing on 16/5/21.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNMusicViewController: UITableViewController {
  var videoEntityList =  MNMusicEntityList()
  var rowHeightCache =  [Int: CGFloat]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTableView()
    initData()
  }
  
  func initData() {
    videoEntityList.loadMusicData()
  }
  
  func setupTableView() {
    let top:CGFloat               = 64
    let bottom                    = (self.tabBarController?.tabBar.height) ?? 0
    self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
    self.tableView.contentInset   = UIEdgeInsetsMake(top, 0, bottom, 0)
    let nib                       = UINib(nibName: String(MNExploreCell), bundle: nil)
    self.tableView.registerNib(nib, forCellReuseIdentifier: MNExploreCell.identifier)
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return videoEntityList.meows?.count ?? 0
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell     = tableView.dequeueReusableCellWithIdentifier(MNExploreCell.identifier) as! MNExploreCell
    let meow     = videoEntityList.meows![indexPath.row]
    let explore  = MNExploreEntity(meow: meow)
    cell.explore = explore
    return cell
  }
  
  
  override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    let  meow =    videoEntityList.meows![indexPath.row]
    if let rowHeight = rowHeightCache[meow.id ?? 0] {
      return rowHeight
    }
    let  height  = meow.cellHeight
    rowHeightCache[meow.id ?? 0] = height
    return height ?? 0
  }
  
}
