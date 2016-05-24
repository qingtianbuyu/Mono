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
  
  var exploreEntity:MNExploreEntityList = MNExploreEntityList()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTableView()
    initData()
  }
  
  func initData() {
    exploreEntity.loadExploreEntityList("1")
    
    
  }
  
  
  
  func setupTableView() -> Void {
    let top:CGFloat     = 64
    let bottom:CGFloat  = (self.tabBarController?.tabBar.height)!
    tableView.rowHeight = 60
    tableView.estimatedRowHeight = 60
    tableView.contentInset = UIEdgeInsetsMake(top, 0, bottom, 0)
    tableView.backgroundColor = UIColor.clearColor()
    
    let cellNib = UINib(nibName: String(MNExploreCell), bundle: nil)
    tableView.registerNib(cellNib, forCellReuseIdentifier: cellId)
  }
  
  
  
  override  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell =  tableView.dequeueReusableCellWithIdentifier(cellId , forIndexPath: indexPath) as! MNExploreCell
//    cell.
    return cell
  }

  
}


