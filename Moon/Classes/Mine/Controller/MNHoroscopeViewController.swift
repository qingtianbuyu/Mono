//
//  MNHoroscopeViewController.swift
//  Moon
//
//  Created by YKing on 16/6/24.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

/// 星座
class MNHoroscopeViewController: UITableViewController {

  lazy var horoscopeEntity = MNHoroscopeEntityList()
  
    override func viewDidLoad() {
      super.viewDidLoad()
      setupTableView()
      initData()
  }
  
  func initData() {
    horoscopeEntity.loadScopeData()
  }
  
  func setupTableView() {
    let nib = MNHoroscopeCell.nib() as! UINib
      self.tableView.registerNib(nib , forCellReuseIdentifier: MNHoroscopeCell.viewIdentify)
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return horoscopeEntity.horoscopes?.count ?? 0
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(MNHoroscopeCell.viewIdentify) as! MNHoroscopeCell
    cell.horoscope = horoscopeEntity.horoscopes![indexPath.row]
    return cell
  }
  

  override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
    return 48
  }

}
