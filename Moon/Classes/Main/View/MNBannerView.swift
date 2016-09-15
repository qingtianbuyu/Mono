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
  var timer: Timer?
  
  
  var banners: [MNBanner]? {
    didSet {
      self.bannerView.reloadData()
      startTask()
    }
  }
  
  
  func scrollToNext() -> Void {
    guard (self.banners?.count) != nil else {
      return
    }
    
    //计算当前展示cell的索引值
    let indexPath =   self.bannerView.indexPathsForVisibleItems.last
    //计算下一个要展示的位置
    var nextIndex  =   (indexPath?.item ?? 0) + 1
    if nextIndex == self.banners?.count {
        nextIndex = 0
    }
    
    let nextIndexPath = IndexPath(item: nextIndex, section: 0)
    //动画划动至下一个位置
    self.bannerView.scrollToItem(at: nextIndexPath, at: UICollectionViewScrollPosition.left, animated: true)
  }
  
  override func awakeFromNib() {
   super.awakeFromNib()
    let flow                   = UICollectionViewFlowLayout()
    flow.itemSize = CGSize(width:ScreenWidth, height:190)
    flow.minimumInteritemSpacing      = 0
    flow.minimumLineSpacing           = 0
    flow.scrollDirection       = UICollectionViewScrollDirection.horizontal
    self.bannerView.showsVerticalScrollIndicator = false
    self.bannerView.backgroundColor = commonBgColor
    self.bannerView.showsHorizontalScrollIndicator = false
    self.bannerView.setCollectionViewLayout(flow, animated: true)
    self.bannerView.isPagingEnabled = true
    self.bannerView.delegate   = self
    self.bannerView.dataSource = self
    let nib  = UINib.init(nibName: String(describing: MNBannerViewCell.self), bundle: nil)
    self.bannerView.register(nib, forCellWithReuseIdentifier: MNBannerViewCell.viewIdentify)
  }
  
  func removeTask() {
    self.timer?.invalidate()
  }
  
  func startTask() {
    timer = Timer(timeInterval: 2.0, target: self, selector: #selector(MNBannerView.scrollToNext), userInfo: nil, repeats: true)
    RunLoop.main.add(timer!, forMode: RunLoopMode.commonModes)
  }
  
}

extension MNBannerView: UICollectionViewDelegate, UICollectionViewDataSource{
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.banners?.count ?? 0
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MNBannerViewCell.viewIdentify, for: indexPath) as! MNBannerViewCell
    cell.banner = self.banners![indexPath.row]
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    collectionView.deselectItem(at: indexPath as IndexPath, animated: true)
  }
  
  func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
    self.removeTask()
  }
  
  func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
    self.startTask()
  }

}
