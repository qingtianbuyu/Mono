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
  
  var banners: [MNBanner]? {
    didSet {
      self.bannerView.reloadData()
    }
  }
  
  override func awakeFromNib() {
   super.awakeFromNib()
    let flow                   = UICollectionViewFlowLayout()
    flow.itemSize = CGSizeMake(self.width, 190)
    flow.minimumInteritemSpacing      = 0
    flow.minimumLineSpacing           = 0
    flow.scrollDirection       = UICollectionViewScrollDirection.Horizontal
    self.bannerView.setCollectionViewLayout(flow, animated: true)
    self.bannerView.delegate   = self
    self.bannerView.dataSource = self
    let nib  = UINib.init(nibName: String(MNBannerViewCell), bundle: nil)
    self.bannerView.registerNib(nib, forCellWithReuseIdentifier: MNBannerViewCell.viewIdentify)
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

}