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

  var titleView:MNNavgationBar?
  var scrollView:UIScrollView?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupChildViewContrllers()
    setupBasicView()
    setupScrollView()
  }
  
   func setupBasicView() {
    view.backgroundColor                            = commonBgColor
    self.navigationController?.navigationBar.hidden = true
    self.edgesForExtendedLayout                     = UIRectEdge.None
    titleView                                       = MNNavgationBar(frame: CGRect.zero)
    titleView!.titles                               = titles
    titleView!.delegate                              = self
    view.addSubview(titleView!)
  }
  
  func setupScrollView() {
    self.automaticallyAdjustsScrollViewInsets = false
    let scrollView                            = UIScrollView(frame: self.view.bounds)
    scrollView.pagingEnabled                  = true
    scrollView.delegate                       = self
    scrollView.showsVerticalScrollIndicator   = false
    scrollView.showsHorizontalScrollIndicator = false
    let width                                 = CGFloat(self.childViewControllers.count) * scrollView.width
    scrollView.contentSize                    = CGSizeMake(width, 0)
    view.insertSubview(scrollView, atIndex: 0)
    self.scrollView                           = scrollView
    scrollViewDidEndScrollingAnimation(scrollView)
  }
  
  func setupChildViewContrllers() -> Void {
    addChildViewController(MNExploreViewController())
    addChildViewController(MNFollowingViewController())
    addChildViewController(MNVideoViewController())
    addChildViewController(MNMusicViewController())
    addChildViewController(MNGalleryViewController())
    addChildViewController(MNTeaViewController())
  }
}

extension MNRecommandViewController:UIScrollViewDelegate, titleViewDelegate {
  
  func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView) {
    //获取当前位置的索引
    let index          = Int(scrollView.contentOffset.x / scrollView.width)
    let   childVc      = self.childViewControllers[index]
    var   frame        = childVc.view.frame
    frame.origin.x     = scrollView.contentOffset.x
    frame.origin.y     = 0
    frame.size.height  = scrollView.height
    childVc.view.frame = frame
    scrollView.addSubview(childVc.view)
  }
  
  func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
    scrollViewDidEndScrollingAnimation(scrollView)
    let index  = Int(scrollView.contentOffset.x / scrollView.width)
    let indexPath  = NSIndexPath(forItem: index, inSection: 0)
    titleView?.collection?.delegate?.collectionView!((titleView?.collection)!, didSelectItemAtIndexPath: indexPath)
  }
  
  func didSelectTitleViewAtIndex(index: Int) {
    var offset = self.scrollView!.contentOffset
    offset.x   = (CGFloat(index) * self.scrollView!.width)
    self.scrollView!.setContentOffset(offset, animated: true);
  }
  

}
