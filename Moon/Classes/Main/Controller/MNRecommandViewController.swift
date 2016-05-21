//
//  MNRecommandViewController.swift
//  Moon
//
//  Created by YKing on 16/5/19.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNRecommandViewController: UIViewController {
  
  
  lazy var titles:[MNTitle] = [ MNTitle.initWithTitle("推荐Explore"),
                           MNTitle.initWithTitle("关注Following"),
                           MNTitle.initWithTitle("视频Video"),
                           MNTitle.initWithTitle("音乐Music"),
                           MNTitle.initWithTitle("画册Gallery"),
                           MNTitle.initWithTitle("往期早午茶"),
                           ]
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupBasicView()
    setupScrollView()
    setupChildViewContrllers()
  }
  
   func setupBasicView() {
      self.navigationController?.navigationBar.hidden = true
      view.backgroundColor        = UIColor.whiteColor()
      self.edgesForExtendedLayout = UIRectEdge.None
      let titleView = MNNavgationBar(frame: CGRect.zero)
      titleView.titles = titles
      view.addSubview(titleView)
  }
  
  func setupScrollView() {
    let scrollView = UIScrollView(frame: self.view.bounds)
    
    view .addSubview(scrollView)
  }
  
  func setupChildViewContrllers() -> Void {
    
  }
  
  
}
