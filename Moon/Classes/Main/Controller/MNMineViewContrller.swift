//
//  MNMeViewContrller.swift
//  Moon
//
//  Created by YKing on 16/5/19.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNMineViewContrller: UITableViewController {
  
  var followFeedEntity = MNFollowFeedEntity()
  var iconViewCenterY: CGFloat  = 0
  
  lazy var iconView: UIImageView? = {
    let iconWH:CGFloat = 192 * 0.5
    let iconF = CGRect(x: 15, y: 32, width: iconWH, height: iconWH)
    let iconView = UIImageView(frame:iconF)
    self.navigationController?.view.addSubview(iconView)
    iconView.layer.borderColor = UIColor.white.cgColor
    iconView.layer.borderWidth = 1
    iconView.clipsToBounds = true
    iconView.layer.cornerRadius = iconView.width * 0.5
    iconView.m_setImageWithUrl("http://mmmono.qiniudn.com/FuwgYPymesuyh2_eGlwqUg_hsykF")
    return iconView
  }()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.purple
    setupView()
    initData()
  }
  
  func setupView() {
    self.iconViewCenterY = self.iconView?.center.y ?? 0
    setupNav()
    setupTableView()
//    setupIconView()
  }
  
  func setupNav() {
    self.navigationItem.title                                    = "YKing"
    self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
    self.navigationItem.rightBarButtonItem                       = UIBarButtonItem.buttonWithImage("icon-setting-white", target: self, action: #selector(MNMineViewContrller.settingClick))
    self.navigationController?.navigationBar.barTintColor        = UIColor.black
  }
  
  func setupTableView(){
    self.tableView.separatorStyle  = UITableViewCellSeparatorStyle.none
    let nib                        = MNFollowFeedCell.nib() as! UINib
    self.tableView.register(nib, forCellReuseIdentifier: MNFollowFeedCell.viewIdentify)
  }
  
  func setupIconView() {
    let iconWH:CGFloat = 192 * 0.5
    let iconF = CGRect(x: 15, y: 32, width: iconWH, height: iconWH)
    let iconView = UIImageView(frame:iconF)
    self.navigationController?.view.addSubview(iconView)
    iconView.layer.borderColor = UIColor.white.cgColor
    iconView.layer.borderWidth = 1
    iconView.clipsToBounds = true
    iconView.layer.cornerRadius = iconView.width * 0.5
    iconView.m_setImageWithUrl("http://mmmono.qiniudn.com/FuwgYPymesuyh2_eGlwqUg_hsykF")
  }
  
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.iconView?.isHidden = false
    let headerView                 = MNMineHeaderView.viewFromXib() as! MNMineHeaderView
    let headerHeight = headerView.calcHeight()
    headerView.bounds = CGRect(x: 0, y: 0, width: ScreenWidth, height: headerHeight)
    self.tableView.tableHeaderView = headerView
    headerView.delegate = self
  }
  
  func initData() {
    followFeedEntity.loadFollowFeed()
  }
  
  /**
   点击设置
   */
  func settingClick() -> Void {
    
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return followFeedEntity.data?.count ?? 0
  }
  
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: MNFollowFeedCell.viewIdentify) as! MNFollowFeedCell
    cell.followFeed = followFeedEntity.data![indexPath.row]
    return cell
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    let followFeed = followFeedEntity.data![indexPath.row]
    if followFeed.action == 7 {
      return 160
    } else if followFeed.action == 5 {
      // music
      return 187
    }
    return 0
  }
  

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
  
  override func scrollViewDidScroll(_ scrollView: UIScrollView) {
    var offsetY = scrollView.contentOffset.y
    
    //缩放相关
    offsetY *= (-1)
    var iconViewBounds = self.iconView?.bounds
    let iconWH:CGFloat = 192 * 0.5
    let minIconWH:CGFloat = 64 * 0.5
    // 随着滚动缩减的头像的尺寸
    let dtR = offsetY * (iconWH * 0.5 - minIconWH * 0.5) / (self.iconViewCenterY - 42)
    let wh = 2 * dtR
    if wh  < 30 || wh > iconWH {
        return
    }
    
    self.iconView!.layer.cornerRadius = wh/2.0;
    iconViewBounds!.size.height = wh;
    iconViewBounds!.size.width  = wh;
    self.iconView!.bounds = iconViewBounds!;
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    self.iconView?.isHidden = true
  }
  
}

extension MNMineViewContrller: MineHeaderViewDelegate {
  
  func editClick() {
    let st = UIStoryboard(name: String(describing: MNUserInfoViewController.self), bundle: Bundle.main)
    let vc = st.instantiateViewController(withIdentifier: String(describing: MNUserInfoViewController.self))
    let nav = MNBackNavgationController(rootViewController: vc)
    self.navigationController?.present(nav, animated: true, completion: nil)
  }
  func tipClick() {
    
  }
  
  func favoriteClick() {
    
  }
  func messageClick() {
    
  }

  func saySthClick() {
    
  }
}

