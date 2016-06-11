//
//  MNBannerView.swift
//  Moon
//
//  Created by YKing on 16/6/10.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNBannerView: UIView {

  @IBOutlet weak var bannerView: UICollectionView!
  var timer: NSTimer?
  
  
  var banners: [MNBanner]? {
    didSet {
      self.bannerView.reloadData()
      startTask()
    }
  }
  
  
  func scrollToNext() -> Void {
    //计算当前展示cell的索引值
    let indexPath =   self.bannerView.indexPathsForVisibleItems().last
    //计算下一个要展示的位置
    var nextIndex  =   (indexPath?.item ?? 0) + 1
    if nextIndex == self.banners?.count {
        nextIndex = 0
    }
    
    let nextIndexPath = NSIndexPath(forItem: nextIndex, inSection: 0)
    //动画划动至下一个位置
    self.bannerView.scrollToItemAtIndexPath(nextIndexPath, atScrollPosition: UICollectionViewScrollPosition.Left, animated: true)
  }
  
  override func awakeFromNib() {
   super.awakeFromNib()
    let flow                   = UICollectionViewFlowLayout()
    flow.itemSize = CGSizeMake(self.width, 190)
    flow.minimumInteritemSpacing      = 0
    flow.minimumLineSpacing           = 0
    flow.scrollDirection       = UICollectionViewScrollDirection.Horizontal
    self.bannerView.showsVerticalScrollIndicator = false
    self.bannerView.backgroundColor = commonBgColor
    self.bannerView.showsHorizontalScrollIndicator = false
    self.bannerView.setCollectionViewLayout(flow, animated: true)
    self.bannerView.pagingEnabled = true
    self.bannerView.delegate   = self
    self.bannerView.dataSource = self
    let nib  = UINib.init(nibName: String(MNBannerViewCell), bundle: nil)
    self.bannerView.registerNib(nib, forCellWithReuseIdentifier: MNBannerViewCell.viewIdentify)
  }
  
  func removeTask() {
    self.timer?.invalidate()
  }
  
  func startTask() {
    timer = NSTimer(timeInterval: 2.0, target: self, selector: #selector(MNBannerView.scrollToNext), userInfo: nil, repeats: true)
    NSRunLoop.mainRunLoop().addTimer(timer!, forMode: NSRunLoopCommonModes)
  }
  
}

extension MNBannerView: UICollectionViewDelegate, UICollectionViewDataSource{
  
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.banners?.count ?? 0
  }
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier(MNBannerViewCell.viewIdentify, forIndexPath: indexPath) as! MNBannerViewCell
    cell.banner = self.banners![indexPath.row]
    return cell
  }
  
  func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    collectionView.deselectItemAtIndexPath(indexPath, animated: true)
  }
  
  func scrollViewWillBeginDragging(scrollView: UIScrollView) {
    self.removeTask()
  }
  
  func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    self.startTask()
  }

}