//
//  MNExploreViewController.swift
//  Moon
//
//  Created by YKing on 16/5/21.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit
import Alamofire

public  let cellId = "explorer"

class MNExploreViewController: UITableViewController {
  
  var exploreEntityModel:MNExploreEntityList = MNExploreEntityList()
  var exploreEntityList: [MNExploreEntity]? {
    return exploreEntityModel.entity_list
  }
  
  var rowHeightCache = [Int: CGFloat]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTableView()
    initData()
  }
  
  func initData() {
    exploreEntityModel.loadExploreEntityList("1")
  }
  
  func setupTableView() -> Void {
    let top:CGFloat     = 64
    let bottom:CGFloat  = (self.tabBarController?.tabBar.height)!
    tableView.contentInset = UIEdgeInsetsMake(top, 0, bottom, 0)
    tableView.backgroundColor = UIColor.clearColor()
    tableView.sectionFooterHeight = 20
    let cellNib = UINib(nibName: String(MNExploreCell), bundle: nil)
    tableView.registerNib(cellNib, forCellReuseIdentifier: cellId)
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return exploreEntityList?.count ?? 0
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell =  tableView.dequeueReusableCellWithIdentifier(cellId , forIndexPath: indexPath) as! MNExploreCell
    let explore = exploreEntityList![indexPath.row]
    cell.explore =  explore
    return cell
  }
  
  override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    let explore = exploreEntityList![indexPath.row]
    
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


