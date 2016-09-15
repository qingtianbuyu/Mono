//
//  MNVideoViewController.swift
//  Moon
//
//  Created by YKing on 16/5/21.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNVideoViewController: UITableViewController {
  
  var videoEntityList =  MNVideoEntityList()
  var rowHeightCache =  [Int: CGFloat]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTableView()
    initData()
  }
  
  func initData() {
      videoEntityList.loadVideoData()
  }
  
  func setupTableView() {
    let top:CGFloat               = 64
    let bottom                    = (self.tabBarController?.tabBar.height) ?? 0
    self.tableView.separatorStyle = UITableViewCellSeparatorStyle.none
    self.tableView.contentInset   = UIEdgeInsetsMake(top, 0, bottom, 0)
    let nib                       = UINib(nibName: String(describing: MNExploreCell.self), bundle: nil)
    self.tableView.register(nib, forCellReuseIdentifier: MNExploreCell.identifier)
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return videoEntityList.meows?.count ?? 0
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell     = tableView.dequeueReusableCell(withIdentifier: MNExploreCell.identifier) as! MNExploreCell
    let meow     = videoEntityList.meows![(indexPath as NSIndexPath).row]
    let explore  = MNExploreEntity(meow: meow)
    cell.explore = explore
    return cell
  }
  
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    let  meow =    videoEntityList.meows![(indexPath as NSIndexPath).row]
    if let rowHeight = rowHeightCache[meow.id ] {
      return rowHeight
    }
    let  height  = meow.cellHeight
    rowHeightCache[meow.id ] = height
    return height 
  }
  
}
