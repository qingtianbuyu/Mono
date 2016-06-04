//
//  MNTeaViewController.swift
//  Moon
//
//  Created by YKing on 16/5/21.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

class MNTeaViewController: UIViewController {

  var recentTeaEntityList = MNRecentTeaEntityList()
  var collectionView: UICollectionView?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupCollectionView()
    initData()
  }
  
  func initData() {
    recentTeaEntityList.loadRecentTeaData()
  }
  
  
  func setupCollectionView() {
    let layout                                = UICollectionViewFlowLayout()
    layout.scrollDirection                    = UICollectionViewScrollDirection.Vertical
    let  width                                = (ScreenWidth - 1) * 0.5
    layout.itemSize                           = CGSizeMake(width, 187.5)
    layout.minimumLineSpacing                 = 1
    layout.minimumInteritemSpacing            = 1
    let collectionView                        = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
    self.view.addSubview(collectionView)
    collectionView.backgroundColor            = UIColor.clearColor()
    collectionView.delegate                   = self
    collectionView.dataSource                 = self
    self.collectionView                       = collectionView
    self.collectionView?.collectionViewLayout = layout
    let top: CGFloat                          = 64
    let bottom: CGFloat                       = self.tabBarController?.tabBar.height ?? 0
    self.collectionView?.contentInset         = UIEdgeInsetsMake(top, 0, bottom, 0)

    let nib                                   = UINib(nibName: MNTeaCell.viewIdentify, bundle: nil)
    self.collectionView?.registerNib(nib, forCellWithReuseIdentifier: MNTeaCell.viewIdentify)
  }
  
}

extension MNTeaViewController: UICollectionViewDataSource, UICollectionViewDelegate {
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return recentTeaEntityList.recent_tea?.count ?? 0
  }
  
   func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier(MNTeaCell.viewIdentify, forIndexPath: indexPath) as! MNTeaCell
    let tea = recentTeaEntityList.recent_tea![indexPath.row]
    cell.tea = tea
    return cell
  }
}
