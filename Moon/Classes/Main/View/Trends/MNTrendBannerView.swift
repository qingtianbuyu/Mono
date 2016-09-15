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
  
  var timer: Timer?
  
  var meows: [MNMeow]? {
    didSet {
      self.bannerView.reloadData()
      startTask()
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    let layout = UICollectionViewFlowLayout()
    layout.itemSize = CGSize(width: ScreenWidth, height:190)
    layout.scrollDirection = UICollectionViewScrollDirection.horizontal
    
    layout.minimumLineSpacing = 0
    layout.minimumInteritemSpacing = 0
    self.bannerView.showsHorizontalScrollIndicator =  false
    self.bannerView.setCollectionViewLayout(layout, animated: true)
    self.bannerView.isPagingEnabled = true
    self.bannerView.delegate = self
    self.bannerView.dataSource = self
    let nib = MNTrendBannerViewCell.nib() as! UINib
    self.bannerView.register(nib, forCellWithReuseIdentifier: MNTrendBannerViewCell.viewIdentify)
  }
  
  func startTask(){
    self.timer = Timer(timeInterval: 2.0, target: self, selector: #selector(MNTrendBannerView.scrollToNext), userInfo: nil, repeats: true)
    RunLoop.main.add(self.timer!, forMode: RunLoopMode.commonModes)
  }
  
  func stopTask() {
    self.timer?.invalidate()
    self.timer = nil
  }
  
  func scrollToNext() {
    // 1. 获取当前正在展示的cell的索引
    let curIndexPath  =   self.bannerView.indexPathsForVisibleItems.last
    // 2. 获取下一页的索引
    var nextIndexItem = (curIndexPath?.item ?? 0) + 1
    let memowsCount = self.meows?.count ?? 0
    if nextIndexItem == memowsCount {
        nextIndexItem = 0
    }
    
    let nextIndexPath = IndexPath(item: nextIndexItem, section: 0)
    self.bannerView.scrollToItem(at: nextIndexPath, at: UICollectionViewScrollPosition.left, animated: true)
    
  }
  
}

extension MNTrendBannerView: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.meows?.count ?? 0
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MNTrendBannerViewCell.viewIdentify, for: indexPath as IndexPath) as! MNTrendBannerViewCell
    let meow = self.meows![indexPath.row]
    cell.meow = meow
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    collectionView.deselectItem(at: indexPath as IndexPath, animated: true)
  }
  
  func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
    self.stopTask()
  }
  
  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    self.startTask()
  }

}
