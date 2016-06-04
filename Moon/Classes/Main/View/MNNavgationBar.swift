//
//  MNNavgationBar.swift
//  Moon
//
//  Created by YKing on 16/5/21.
//  Copyright © 2016年 YKing. All rights reserved.
//

import UIKit

protocol titleViewDelegate{
  func didSelectTitleViewAtIndex(let index:Int)
}

class MNNavgationBar: UIView {

  var collection:UICollectionView?
  var delegate:titleViewDelegate?
  
  
  var titles:[MNTitle]?{
    didSet{
      collection?.reloadData()
    }
  }
  
  var curPosition:Int = 0
  
  
  override init(frame: CGRect) {
    let nFrame = CGRectMake(0, 0, ScreenBounds.width, 64)
    super.init(frame: nFrame)
    self.backgroundColor = UIColor.blackColor()
    setupCollectionView()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupCollectionView() -> Void {
    let flowLayout                             = UICollectionViewFlowLayout()
    flowLayout.scrollDirection                 = UICollectionViewScrollDirection.Horizontal
    flowLayout.itemSize                        = CGSizeMake(100, 44)
    flowLayout.minimumInteritemSpacing         = 1
    flowLayout.minimumLineSpacing              = 1
    collection                                 = UICollectionView(frame: CGRectZero, collectionViewLayout: flowLayout)
    collection!.showsHorizontalScrollIndicator = false
    collection!.showsVerticalScrollIndicator   = false
    collection!.registerClass(MNTitleCell.self, forCellWithReuseIdentifier: "MNTitleCell")
    collection?.delegate                       = self
    collection?.dataSource                     = self
    addSubview(collection!)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    collection?.frame = CGRectMake(0, 20, self.width, 44)
  }
  
  
}

  extension MNNavgationBar:UICollectionViewDataSource , UICollectionViewDelegate {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return titles?.count ?? 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
      let collectionCell = collectionView.dequeueReusableCellWithReuseIdentifier("MNTitleCell", forIndexPath: indexPath) as! MNTitleCell
      let title = titles?[indexPath.row]
      title!.enable = (indexPath.row == curPosition)
      collectionCell.title = title
      return collectionCell
    }
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
      collectionView.deselectItemAtIndexPath(indexPath, animated: true)
      collectionView.scrollToItemAtIndexPath(indexPath, atScrollPosition: UICollectionViewScrollPosition.CenteredHorizontally, animated: true)
      delegate?.didSelectTitleViewAtIndex(indexPath.row)
      curPosition = indexPath.row
      
      collectionView.reloadData()
    }
  
  
  }