//
//  MNExploreViewController.swift
//  Moon
//
//  Created by YKing on 16/5/21.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit


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
    let top:CGFloat               = 64
    let bottom:CGFloat            = (self.tabBarController?.tabBar.height)!
    tableView.contentInset        = UIEdgeInsetsMake(top, 0, bottom, 0)
    tableView.backgroundColor     = UIColor.clear
    tableView.sectionFooterHeight = 20
    tableView.separatorStyle      = UITableViewCellSeparatorStyle.none
    let cellNib                   = UINib(nibName: String.init(describing: MNExploreCell.self), bundle: nil)
    tableView.register(cellNib, forCellReuseIdentifier: MNExploreCell.identifier)
    
  }
  
   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return exploreEntityList?.count ?? 0
  }
  
  
  
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell     = tableView.dequeueReusableCell(withIdentifier: MNExploreCell.identifier , for: indexPath as IndexPath) as! MNExploreCell
    let explore  = exploreEntityList![(indexPath as NSIndexPath).row]
    cell.explore = explore
    return cell
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    let explore = exploreEntityList![(indexPath as NSIndexPath).row]
    if let rowHeight = rowHeightCache[explore.meow?.id ?? 0] {
        return rowHeight
    }
    let  height  = explore.meow!.cellHeight
    rowHeightCache[explore.meow?.id ?? 0] = height
    return height
  }
  
   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath as IndexPath, animated: true)
    let searchVc = MNExploreSearchViewController()
    self.navigationController?.pushViewController(searchVc, animated: true)
  }

  
}


