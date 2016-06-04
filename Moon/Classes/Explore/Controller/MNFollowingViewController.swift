//
//  MNFollowingViewController.swift
//  Moon
//
//  Created by YKing on 16/5/21.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNFollowingViewController: UITableViewController {

  var follwoingEntityList: MNFollwoingEntityList = MNFollwoingEntityList()
  var rowHeightCache = [Int: CGFloat]()
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.blueColor()
    setupTableView()
    initData()
  }
  
  func initData() -> Void {
    follwoingEntityList.loadFollowingData()
  }
  
  func setupTableView() -> Void {
    let top:CGFloat               = 64
    let bottom:CGFloat            = (self.tabBarController?.tabBar.height)!
    tableView.contentInset        = UIEdgeInsetsMake(top, 0, bottom, 0)
    tableView.backgroundColor     = UIColor.clearColor()
    tableView.sectionFooterHeight = 20
    tableView.separatorStyle      = UITableViewCellSeparatorStyle.None
    let cellNib                   = UINib(nibName: String(MNExploreCell), bundle: nil)
    tableView.registerNib(cellNib, forCellReuseIdentifier: MNExploreCell.identifier)
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return follwoingEntityList.data?.count ?? 0
  }
  
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell     = tableView.dequeueReusableCellWithIdentifier(MNExploreCell.identifier , forIndexPath: indexPath) as! MNExploreCell
    let explore  = follwoingEntityList.data![indexPath.row]
    cell.explore = explore
    return cell
  }
  
  override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    let explore = follwoingEntityList.data![indexPath.row]
    
    if let rowHeight = rowHeightCache[explore.meow?.id ?? 0] {
      return rowHeight
    }
    let  height  = explore.meow!.cellHeight
    rowHeightCache[explore.meow?.id ?? 0] = height
    return height ?? 0
  }
  
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
  }

  
}
