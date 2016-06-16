//
//  MNTrendBannerView.swift
//  Moon
//
//  Created by YKing on 16/6/16.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNTrendBannerView: UIView {

  @IBOutlet weak var bannerView: UICollectionView!
  
  var timer: NSTimer?
  
  var meows: [MNMeow]? {
    didSet {
      self.bannerView.reloadData()
      startTask()
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    let layout = UICollectionViewFlowLayout()
    layout.itemSize = CGSizeMake(ScreenWidth, 190)
    layout.scrollDirection = UICollectionViewScrollDirection.Horizontal
    
    layout.minimumLineSpacing = 0
    layout.minimumInteritemSpacing = 0
    self.bannerView.showsHorizontalScrollIndicator =  false
    self.bannerView.setCollectionViewLayout(layout, animated: true)
    self.bannerView.pagingEnabled = true
    self.bannerView.delegate = self
    self.bannerView.dataSource = self
    let nib = MNTrendBannerViewCell.nib() as! UINib
    self.bannerView.registerNib(nib, forCellWithReuseIdentifier: MNTrendBannerViewCell.viewIdentify)
  }
  
  func startTask(){
    self.timer = NSTimer(timeInterval: 2.0, target: self, selector: #selector(MNTrendBannerView.scrollToNext), userInfo: nil, repeats: true)
  NSRunLoop.mainRunLoop().addTimer(self.timer!, forMode: NSRunLoopCommonModes)
  }
  
  func stopTask() {
    self.timer?.invalidate()
    self.timer = nil
  }
  
  func scrollToNext() {
    // 1. 获取当前正在展示的cell的索引
    let curIndexPath  =   self.bannerView.indexPathsForVisibleItems().last
    // 2. 获取下一页的索引
    var nextIndexItem = (curIndexPath?.item ?? 0) + 1
    let memowsCount = self.meows?.count ?? 0
    if nextIndexItem == memowsCount {
        nextIndexItem = 0
    }
    
    let nextIndexPath = NSIndexPath(forItem: nextIndexItem, inSection: 0)
    self.bannerView.scrollToItemAtIndexPath(nextIndexPath, atScrollPosition: UICollectionViewScrollPosition.Left, animated: true)
    
  }
  
}

extension MNTrendBannerView: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.meows?.count ?? 0
  }
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier(MNTrendBannerViewCell.viewIdentify, forIndexPath: indexPath) as! MNTrendBannerViewCell
    let meow = self.meows![indexPath.row]
    cell.meow = meow
    return cell
  }
  
  func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    collectionView.deselectItemAtIndexPath(indexPath, animated: true)
  }
  
  func scrollViewWillBeginDragging(scrollView: UIScrollView) {
    self.stopTask()
  }
  
  func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
    self.startTask()
  }

}
